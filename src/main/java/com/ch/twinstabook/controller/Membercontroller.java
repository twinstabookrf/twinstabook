package com.ch.twinstabook.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.twinstabook.model.Member;
import com.ch.twinstabook.model.Post;
import com.ch.twinstabook.model.Reply;
import com.ch.twinstabook.service.FollowService;
import com.ch.twinstabook.service.MediaService;
import com.ch.twinstabook.service.MemberService;
import com.ch.twinstabook.service.PostService;
import com.ch.twinstabook.service.ReplyService;

@Controller
public class Membercontroller {
	@Autowired
	private MemberService ms;
	@Autowired
	private PostService ps;
	@Autowired
	private ReplyService rs;
	@Autowired
	private MediaService mds;
	@Autowired
	private FollowService fs;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	

	@RequestMapping("signUpForm")
	public String signUpForm() {
		return "join/signUpForm";
	}
	
	@RequestMapping("pwdHint")
	public String pwdHint() {
		
		return "join/pwdHint";
	}
	
	@RequestMapping("pwdHint2")
	public String pwdHint2(String member_id, Model model) {
		int result =0;
		 Member member = ms.select(member_id);
		 if(member == null) {
			 result = -1;    	//없는 아이디 
		 } else {
			 result = 1;
		 }
		 model.addAttribute("member",member);
		 model.addAttribute("result",result);
		 return "join/pwdHint2";
	}
	
	@RequestMapping("pwdHint3")
	public String pwdHint3(Member member,String member_id, Model model) {
		int result =0;
		Member member2 = ms.select(member.getMember_id());
		if (member.getAnswer().equals(member2.getAnswer())) {
			result = 1;		// 답과 db값이 같음
		} else {
			result = -1;	// 입력한 비밀번호찾기 답과 db값이 다름
		}
		model.addAttribute("result", result);
		return "join/pwdHint3";
	}
	
	@RequestMapping("pwdHint4")
	public String pwdHint4(Member member,String member_id, Model model) {
		int result = 0;
			String encPassword = passwordEncoder.encode(member.getPwd());
			member.setPwd(encPassword);
			result = ms.update(member);
			result = 0;
		
		model.addAttribute("result",result);
		return "join/pwdHint4";
	}
	
	@RequestMapping("updateForm1")
	public String updateForm1(Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		Member member = ms.select(member_id);
		model.addAttribute("member",member);
		return "join/updateForm1";
	}
	@RequestMapping("update1")
	public String update1(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		String fileName = member.getFile().getOriginalFilename();
		if(fileName != null && !fileName.equals("")) {  
			 member.setProfile_pic(fileName); 
			String real = session.getServletContext().getRealPath("/resources  /upload");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(member.getFile().getBytes());
			fos.close();
		}
		String encPassword = passwordEncoder.encode(member.getPwd());
		member.setPwd(encPassword);
		result = ms.updateAll(member);
		
		model.addAttribute("result",result);
		return "join/update1";
	}
	@RequestMapping("delete1")
	public String delete1(Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		int result = ms.delete(member_id);
		if(result > 0) session.invalidate();   //세션 없애는 것(탈퇴처리)
		model.addAttribute("result",result);
		return "join/delete1";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "join/logout";
	}
	
	@RequestMapping("profile")
	public String profile(Member member, Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		if (member_id != null && !member_id.equals("")) {
			member = ms.select(member_id);
			model.addAttribute("member", member);
		}
		return "join/profile";
		
	}
	
	@RequestMapping(value = "idChk", produces = "text/html;charset=utf-8")
	@ResponseBody	// 전에는 return "idChk";통해 보여주지만, @ResponseBody는 jsp를 통하지 않고 직접 문자를 전달함
	public String IdChk(String member_id) {
		String msg="";
		Member member = ms.select(member_id);
		if(member == null) msg="사용 가능한 아이디 입니다 :)";
		else msg="이미 사용중인 아이디 입니다 :(";
		return msg;
	}
	
	@RequestMapping("signUp")
	public String signUp(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		//member는 화면에서 입력한 거, member2는 읽는데이터(아이디로 입력한 데이터가 있으면 중복)
		Member  member2 = ms.select(member.getMember_id());
		if(member2 == null) {
//			String fileName = member.getFile().getOriginalFilename();
//			member.setProfile_pic(fileName);
//			String real = session.getServletContext().getRealPath("/resources/upload");  //실제로 저장되는 공간
//			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));  
//			fos.write(member.getFile().getBytes());
//			fos.close(); 
			//암호화
			String encPassword = passwordEncoder.encode(member.getPwd());
			member.setPwd(encPassword);
			result = ms.insert(member);
		}else result = -1;    //중복되는 
		model.addAttribute("result",result);
		return "join/signUp";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "join/loginForm";
	}
	
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session) {
		 int result=0; 				//암호가 다를때
		 Member member2 = ms.select(member.getMember_id());
		 if(member2 == null || member2.getId_drop().equals("y")) {
			 result = -1;    		//없는 아이디 
		 } else if (passwordEncoder.matches(member.getPwd(), member2.getPwd())) {
			 result = 1; 			// 암호와 아이디 일치
			 session.setAttribute("member_id", member.getMember_id());
			 session.setAttribute("name", member2.getName());	// topNavbar출력용
		 }
		 model.addAttribute("result",result);
		return "join/login";
	}

	@RequestMapping("myPage")
	public String myPage(Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		Member member = ms.select(member_id);		// 맴버 조회
		int postTotal = ps.postTotal(member_id);			// 작성한 포스트 갯수
		List<Post> post = ps.postList(member_id);		// 포스트 리스트
		for(Post post2 : post) {
			// 최초 좋아요
			String firstLike = rs.firstLike(post2.getPostno());
			post2.setFirstLike(firstLike);
			// 각 post별 댓글 추출
			List<Reply> replyList = rs.list(post2.getPostno());
			for(Reply reply : replyList) {
				//	reply에 작성자 이름 추가
				Member replyMember = ms.select(reply.getMember_id());
				reply.setWriter(replyMember.getName());
			}
			// post에 댓글 리스트 추가
			post2.setReplyList(replyList);
			// post에 사진/동영상 리스트 추가
			post2.setMediaList(mds.list(post2.getPostno()));
		}
		
		model.addAttribute("postTotal", postTotal);
		model.addAttribute("member", member);
		model.addAttribute("post", post);
		
		model.addAttribute("follower", "123");
		model.addAttribute("follow", "54");
		model.addAttribute("greeting", "안녕하세요");

		return "page/myPage";
	}
	@RequestMapping("writerPage")
	private String writerPage(Model model, String name) {
		int postTotal = ps.postTotal(name);			// 작성한 포스트 갯수
		Member member = ms.selectName(name);		// 맴버 조회
		List<Post> post = ps.postList(member.getMember_id());		// 포스트 리스트
		for(Post post2 : post) {
			// 최초 좋아요
			String firstLike = rs.firstLike(post2.getPostno());
			post2.setFirstLike(firstLike);
			// 각 post별 댓글 추출
			List<Reply> replyList = rs.list(post2.getPostno());
			for(Reply reply : replyList) {
				//	reply에 작성자 이름 추가
				Member replyMember = ms.select(reply.getMember_id());
				reply.setWriter(replyMember.getName());
			}
			// post에 댓글 리스트 추가
			post2.setReplyList(replyList);
			// post에 사진/동영상 리스트 추가
			post2.setMediaList(mds.list(post2.getPostno()));
		}
		model.addAttribute("postTotal", postTotal);
		model.addAttribute("member", member);
		model.addAttribute("post", post);
		
		return "page/writerPage";
	}
	@RequestMapping("follow")
	private String follow(String member_id, HttpSession session) {
		return "page/follow";		// 일단 page폴더에 해놓은겁니다!
	}
	@RequestMapping("search")
	private String search(Model model, String name, HttpSession session) {
		String member_id =(String)session.getAttribute("member_id");	// 세션에 저장된 아이디
		Member sessionMember = ms.select(member_id);		// 세션에서 받은 아이디로 select
		Member member = ms.selectName(name);	// 입력받은 아이디로 select
		
		int result = 0;
		if (member != null) {
			if (sessionMember.getName().contentEquals(member.getName())) {
				result = 1;		// 세션에 저장된 name과 입력받은 name이 같음
			} else {
				result = 0;		// 세션에 저장된 name과 입력받은 name이 같지 않음
			}
		} else {
			result = -1;	// 없는 아이디
		}
		model.addAttribute("name", name);
		model.addAttribute("result", result);
		return "public/search";
	}
}

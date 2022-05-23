package com.ch.twinstabook.controller;

import java.io.IOException;
import java.lang.System.Logger;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.twinstabook.model.Member;
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
	private BCryptPasswordEncoder passwordEncoder;
	
	
//	@RequestMapping("pwdHint")
//	public String pwdHint(String member_id) {
//		return "join/pwdHint";
//	}
	@RequestMapping("signUpForm")
	public String signUpForm() {
		return "join/signUpForm";
	}
	@RequestMapping("pwdHint2")
	public String pwdHint2(String member_id, Model model) {
		Member member = ms.select(member_id);
		model.addAttribute("member",member);
		return "join/pwdHint2";
	}
	@RequestMapping("pwdHint3")
	public String pwdHint3(Member member,String member_id,String answer) {
		
		int cnt = ms.checkHint(member);
		System.out.println(cnt);
		return "join/pwdHint3";
	}
	

	
//	@RequestMapping(value = "idChk2", produces = "text/html;charset=utf-8")
//	@ResponseBody	// 전에는 return "idChk";통해 보여주지만, @ResponseBody는 jsp를 통하지 않고 직접 문자를 전달함
//	public String IdChk2(String member_id) {
//		String msg="";
//		Member member = ms.select(member_id);
//		if(member == null) msg="없는 아이디 입니다.";
//		return msg;
//	}idChk
	
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
		/*	String fileName = member.getFile().getOriginalFilename();
			member.setProfile_pic(fileName);
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(member.getFile().getBytes());
			fos.close(); */
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
		 int result=0; 			//암호가 다를때
		 Member member2 = ms.select(member.getMember_id());
		 if(member2 == null || member2.getId_drop().equals("y")) {
			 result = -1;    	//없는 아이디 
		 } else if (passwordEncoder.matches(member.getPwd(), member2.getPwd())) {
			 result = 1; 			// 암호와 아이디 일치
			 session.setAttribute("member_id", member.getMember_id());
		 }
		 System.out.println(member2.getPwd());
		 System.out.println(member.getPwd());
		 model.addAttribute("result",result);
		return "join/login";
	}
	
	
	@RequestMapping("pwdHint")
	public String pwdHint() {
		
		return "join/pwdHint";
	}
	@RequestMapping("myPage")
	public String myPage(Model model, HttpSession session) {
//		String member_id =(String)session.getAttribute("member_id");
//		Member member= ms.select(member_id);
//
//		model.addAttribute("member", member);

		
		model.addAttribute("name", "jixmxx");
		model.addAttribute("email", "jixmxx@naver.com");
		model.addAttribute("profile_pic", null);
		model.addAttribute("post", "99");
		model.addAttribute("follower", "756");
		model.addAttribute("follow", "433");
		model.addAttribute("greeting", "소개글 테스트");
		
		model.addAttribute("postno", "1");
		model.addAttribute("origin_member_id", "jixmxx");
		model.addAttribute("member_id", "jixmxx");
		model.addAttribute("content", "게시물 테스트 중");
		model.addAttribute("crt_date", "2022-05-10");
		model.addAttribute("mdf_date", "2022-05-18");
		model.addAttribute("views", "30");
		model.addAttribute("likes", "7");
		model.addAttribute("rts", "2");
		return "mypage/myPage";
	}
}

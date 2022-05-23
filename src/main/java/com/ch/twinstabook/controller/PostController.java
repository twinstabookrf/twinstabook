package com.ch.twinstabook.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ch.twinstabook.model.Media;
import com.ch.twinstabook.model.Member;
import com.ch.twinstabook.model.Post;
import com.ch.twinstabook.model.Reply;
import com.ch.twinstabook.service.MediaService;
import com.ch.twinstabook.service.MemberService;
import com.ch.twinstabook.service.PostService;
import com.ch.twinstabook.service.ReplyService;

@Controller
public class PostController {
	@Autowired
	private PostService ps;
	@Autowired
	private ReplyService rs;
	@Autowired
	private MemberService ms;
	@Autowired
	private MediaService mds;

	@RequestMapping("main")
	public String main(Model model, HttpServletRequest request, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		// fee에 보여줄 post 추출
		List<Post> postList = ps.list(1, 10);
		for(Post post : postList) {
			// post에 작성자(원작자, 게시자) 이름 추가
			Member postWriter = ms.select(post.getMember_id());
			Member postOrigin = ms.select(post.getOrigin_member_id());
			post.setWriter(postWriter.getName());
			post.setOriginWriter(postOrigin.getName());
			// 작성자 프로필 사진
			post.setProfile_pic(postWriter.getProfile_pic());
			// 최초 좋아요
			String firstLike = rs.firstLike(post.getPostno());
			post.setFirstLike(firstLike);
			// 각 post별 댓글 추출
			List<Reply> replyList = rs.list(post.getPostno());
			for(Reply reply : replyList) {
				//	reply에 작성자 이름 추가
				Member replyMember = ms.select(reply.getMember_id());
				reply.setWriter(replyMember.getName());
			}
			// post에 댓글 리스트 추가
			post.setReplyList(replyList);
			// post에 사진/동영상 리스트 추가
			post.setMediaList(mds.list(post.getPostno()));
		}

		Member member = ms.select(member_id);
		
		model.addAttribute("member",member); 
		model.addAttribute("postList",postList);
		return "main";
	}
	@RequestMapping("postWriteForm")
	public String postWriteForm(Model model, HttpSession session) {
		String member_id =(String)session.getAttribute("member_id");
		Member member = ms.select(member_id);
		model.addAttribute("member", member);
		return "post/postWriteForm";
	}
	@RequestMapping("postWrite")
	public String postWrite(Post post, Model model, MultipartHttpServletRequest mhr, HttpSession session) throws IOException {
		int result = 0;
		// 마지막 postno 추출
		int maxpostno = ps.getPostno();
		post.setPostno(maxpostno);
		
		result = ps.insertPost(post);	// 게시물 작성
		model.addAttribute("result", result);
		
		String files = post.getFile().getOriginalFilename();
		if(files != null && !files.equals("")) {	// form에서 넘어온 파일이 있으면
			// 파일 여러개를 한번에 받기
			List<MultipartFile> list = mhr.getFiles("file");
			// 여러개를 하나씩 나눠서 저장하고 media에 넣기
			List<Media> media = new ArrayList<Media>();
			// 실제로 저장될 위치
			String real = session.getServletContext().getRealPath("resources/upload");
			for(MultipartFile mf : list) {
				Media md = new Media();
				UUID uuid = UUID.randomUUID();	// 랜덤하게 아이디 생성
				String fileName1 = mf.getOriginalFilename();	// 넘겨받은 본래의 파일명
				// fileName1.substring(fileName1.lastIndexOf(".")); => 확장자를 가져오기
				String fileName = uuid+fileName1.substring(fileName1.lastIndexOf("."));
				md.setFileName(fileName);
				md.setPostno(maxpostno);
				media.add(md);
				// FileOutputStream : 데이터를 파일에 바이트 스트림으로 저장하기 위해 사용한다.
				FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
				fos.write(mf.getBytes());
				fos.close();
			}
			// media에 insert
			System.out.println(media);
			mds.insertMedia(media);
		}
		return "post/postWrite";
	}
	@RequestMapping("updateForm")
	private String updateForm(Model model, int postno, String member_id) {
		// postno별 post조회
		Post post = ps.select(postno);
		// postno별 리스트 추출
		List<Media> media = mds.list(postno);
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("post", post);
		model.addAttribute("media", media);	
		return "post/updateForm";
	}
	
	@RequestMapping("update")
	private String update(Model model, Post post, String member_id, int postno, 
			 HttpSession session, MultipartHttpServletRequest mhr) throws IOException {
		
		// files에는 null(현재 사진 그대로 사용)일 수도 있고 값(사진변경)이 넘어 올 수도 있다.
		String files = post.getFile().getOriginalFilename();
		if(files != null && !files.equals("")) {
			mds.delete(postno);		// 원래 저장되어 있던 media삭제
			
			// 파일 여러개를 한번에 받기
			List<MultipartFile> list = mhr.getFiles("file");
			// 여러개를 하나씩 나눠서 저장하고 media에 넣기
			List<Media> media = new ArrayList<Media>();
			// 실제로 저장될 위치
			String real = session.getServletContext().getRealPath("resources/upload");
			for(MultipartFile mf : list) {
				Media md = new Media();
				UUID uuid = UUID.randomUUID();	// 랜덤하게 아이디 생성
				String fileName1 = mf.getOriginalFilename();
				String fileName = uuid+fileName1.substring(fileName1.lastIndexOf("."));
				md.setFileName(fileName);
				md.setPostno(postno);
				media.add(md);
				// FileOutputStream : 데이터를 파일에 바이트 스트림으로 저장하기 위해 사용한다.
				FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
				fos.write(mf.getBytes());
				fos.close();
			}
			// media에 insert
			mds.insertMedia(media);
		}
 		
 		// 입력받은 content 받기
 		String content = post.getContent();
 		
 		int result = 0;

 		post.setContent(content);
 		result = ps.update(post);

		
		model.addAttribute("postno", postno);	
		model.addAttribute("member_id", member_id);
		model.addAttribute("result", result);		
		return "post/update";
	}
	@RequestMapping("delete")
	private String delete(int postno, Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		
		// postno별 모든 댓글 삭제
		int result3 = rs.deleteAll(postno);
		// postno별 미디어 삭제
		int result2 = mds.delete(postno);
		// postno별 게시물 삭제
		int result = ps.delete(postno);
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("result3", result3);
		model.addAttribute("result2", result2);
		model.addAttribute("result", result);
		
		return "post/delete";
	}
}

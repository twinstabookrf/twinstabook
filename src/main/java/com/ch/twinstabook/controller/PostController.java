package com.ch.twinstabook.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
	public String main(Model model, HttpServletRequest request) {
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
			/* System.out.println(post.getMediaList()); */
			System.out.println(post);
		}
		// 세션 더미
		Member member = ms.select("manho");
		HttpSession session = request.getSession();
        session.setAttribute("manho",member);
		model.addAttribute("postList",postList);
		model.addAttribute("sessionMem",member);
		return "main";
	}
	@RequestMapping("postWriteForm")
	public String postWriteForm() {
		return "post/postWriteForm";
	}
	@RequestMapping("postWrite")
	public String postWrite(Post post, Model model, MultipartHttpServletRequest mhr, HttpSession session) throws IOException {
		int result = 0;
		// 마지막 postno 추출
		int maxpostno = ps.getPostno();
		post.setPostno(maxpostno);
		
		if (post.getContent() != null || post.getFile() != null) {
			result = ps.insertPost(post);		// 게시글 작성
			model.addAttribute("result", result);
		}

		if(post.getFile() != null) {
			// 파일 여러개를 한번에 받기
			List<MultipartFile> list = mhr.getFiles("file");
			// 여러개를 하나씩 나눠서 저장하고 photos에 넣기
			List<Media> media = new ArrayList<Media>();
			// 실제로 저장될 위치
			String real = session.getServletContext().getRealPath("resources/upload");
			for(MultipartFile mf : list) {
				Media md = new Media();
				String fileName = mf.getOriginalFilename();
				md.setFileName(fileName);
				md.setPostno(maxpostno);
				media.add(md);
				// FileOutputStream : 데이터를 파일에 바이트 스트림으로 저장하기 위해 사용한다.
				FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
				fos.write(mf.getBytes());
				fos.close();
			}
			System.out.println(media);
			// media에 insert
			mds.insertMedia(media);
		}
		return "post/postWrite";
	}
	@RequestMapping("updateFrom")
	private String updateFrom(Model model, int postno) {
		// postno별 post조회
		Post post = ps.select(postno);
		// postno별 리스트 추출
		List<Media> media = mds.selectList(postno);
		model.addAttribute("post", post);
		model.addAttribute("media", media);	
		return "post/updateFrom";
	}
	
	@RequestMapping("update")
	private String update(Model model, Post post, Media media, HttpSession session) throws IOException {
		// fileName에는 null(현재 사진 그대로 사용)일 수도 있고 값(사진변경)이 넘어 올 수도 있다.
		String fileName = post.getFile().getOriginalFilename();
		if(fileName != null && !fileName.equals("")) {	// 사진을 변경 했을 때만 처리
			media.setFileName(fileName);
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(post.getFile().getBytes());
			fos.close();
			/* ms.update(media); */
		}
		int postno = post.getPostno();
		String content = post.getContent();
		
		post.setPostno(postno);
		post.setContent(content);
		
		int result = ps.update(post);
		model.addAttribute("result", result);
		return "post/update";
	}
}

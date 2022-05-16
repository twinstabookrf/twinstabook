package com.ch.twinstabook.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ch.twinstabook.model.Media;
import com.ch.twinstabook.model.Post;
import com.ch.twinstabook.service.MediaService;
import com.ch.twinstabook.service.PostService;

@Controller
public class PostController {
	@Autowired
	private PostService ps;
	@Autowired
	private MediaService ms;
	
	@RequestMapping("main")
	public String main(Model model) {
		Post post = new Post();
		List<Post> list = ps.postList(post);
		model.addAttribute("list",list);
		
		model.addAttribute("writer" , "manho");
		model.addAttribute("email" , "cookieValentain@twinstabook.com");
		model.addAttribute("replyWrier" , "cookie");
		model.addAttribute("replyContent" , "잘 봤습니다");
		model.addAttribute("firstLike" , "manomano");
		model.addAttribute("likes" , 99);
		
		return "main";
	}
	@RequestMapping("postWriteForm")
	public String postWriteForm() {
		return "post/postWriteForm";
	}
	@RequestMapping("postWrite")
	public String postWrite(Post post, Model model, MultipartHttpServletRequest mhr, HttpSession session) throws IOException {
		int result = 0;
		
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
			ms.insertMedia(media);
		}
		return "post/postWrite";
	}
	@RequestMapping("updateFrom")
	private String updateFrom() {
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

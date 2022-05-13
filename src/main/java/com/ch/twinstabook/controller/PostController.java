package com.ch.twinstabook.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
	public String main() {
		return "main";
	}
	@RequestMapping("postWriteForm")
	public String postWriteForm() {
		return "post/postWriteForm";
	}
	@RequestMapping("postWrite")
	public String postWrite(Post post, Model model, MultipartHttpServletRequest mhr, HttpSession session) throws IOException {
		int result = 0;
		// member는 화면에서 입력한 데이터, member2는 읽은 데이터 아이디로 입력한 데이터가 있으면 중복입력
		int maxpostno = ps.getPostno();
		post.setPostno(maxpostno);
		
		if (post.getContent() != null || post.getFile() != null) {
			result = ps.insertPost(post);		// 게시글 작성
			model.addAttribute("result", result);
		}
		
		UUID uuid = UUID.randomUUID();	// 랜덤하게 아이디 생성
		String fileName1 = post.getFile().getOriginalFilename();
		if(post.getFile() != null) {
			// 파일 여러개를 한번에 받기
			List<MultipartFile> list = mhr.getFiles("file");
			// 여러개를 하나씩 나눠서 저장하고 photos에 넣기
			List<Media> media = new ArrayList<Media>();
			// 실제로 저장될 위치
			String real = session.getServletContext().getRealPath("resources/upload");
			for(MultipartFile mf : list) {
				Media md = new Media();
				String fileName = uuid+fileName1.substring(fileName1.lastIndexOf("."));
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
}

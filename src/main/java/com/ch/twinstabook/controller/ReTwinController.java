package com.ch.twinstabook.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.twinstabook.model.Media;
import com.ch.twinstabook.model.Member;
import com.ch.twinstabook.model.Post;
import com.ch.twinstabook.model.ReTwin;
import com.ch.twinstabook.service.FollowService;
import com.ch.twinstabook.service.MediaService;
import com.ch.twinstabook.service.MemberService;
import com.ch.twinstabook.service.PostService;
import com.ch.twinstabook.service.ReTwinService;
import com.ch.twinstabook.service.ReplyService;

@Controller
public class ReTwinController {
	@Autowired
	ReTwinService rts;
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
	
	@RequestMapping("reTwinForm")
	private String reTwinForm(Model model, int postno) {
		Post post = ps.select(postno);
		model.addAttribute("post", post);
		return "post/reTwinForm";
	}
	@RequestMapping("reTwin")
	private String reTwin(Post post, String newRtContent, Model model, HttpSession session) {
		String sessionId = (String)session.getAttribute("member_id");
		Member member = ms.select(sessionId);
		String sessionName = member.getName();
		
		Post post2 = new Post();
		
		// post 마지막 postno 추출
		int maxpostno = ps.getPostno();
		post2.setPostno(maxpostno);
		
		
		ps.updateRts(post.getPostno());	// rt횟수 증가
		Post post3 = ps.select(post.getPostno());	// 받아온 postno로 조회한 post
		
		
		post2.setOrigin_name(post3.getOrigin_name());
		post2.setMember_id(sessionId);
		if (post3.getContent() != null) {
			post2.setContent(post3.getContent());
		}
		int result = 0;
		result = ps.insertPost(post2);	// 게시물 작성
		model.addAttribute("result", result);
		
		List<Media> media2 = mds.list(post.getPostno());	// 받아온 postno로 조회한 mediaList
		List<Media> media = new ArrayList<Media>();
		
		for(int i=0; i<media2.size(); i++) {
			Media md = new Media();
			md.setFileName(media2.get(i).getFileName());			 
			md.setPostno(maxpostno);
			media.add(md);
		 }
		mds.insertMedia(media);
		 
		List<ReTwin> reTwin2 = rts.list(post.getPostno());		// 받아온 postno로 조회한 reTwinList
		List<ReTwin> reTwin = new ArrayList<ReTwin>();			// 새로운 rt글 담는 리스트
		List<ReTwin> reTwin3 = new ArrayList<ReTwin>();		// 기존 rt글 담는 리스트

		if (reTwin2 != null || newRtContent != null) {
			if (reTwin2 != null) {		// 기존 rt글이 있을 때
				for(int i=0; i<reTwin2.size(); i++) {
					ReTwin rt = new ReTwin();	
					rt.setName(reTwin2.get(i).getName());
					rt.setPostno(maxpostno);		// 새로생기는 포스트 번호 넣기
					rt.setRtContent(reTwin2.get(i).getRtContent());
					reTwin3.add(rt);
				}
				rts.insert(reTwin3);
			}
			if (newRtContent != null && newRtContent != "") {		// 새로운 rt글이 있을 때
				ReTwin rt = new ReTwin();	
				rt.setName(sessionName);
				rt.setPostno(maxpostno);
				rt.setRtContent(newRtContent);
				reTwin.add(rt);
			}
			rts.insert(reTwin);
		}
		 return "post/reTwin";
	}
}

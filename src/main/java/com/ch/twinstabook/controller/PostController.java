package com.ch.twinstabook.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.twinstabook.model.Member;
import com.ch.twinstabook.model.Post;
import com.ch.twinstabook.model.Reply;
import com.ch.twinstabook.service.MedaiService;
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
	private MedaiService mds;
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
			System.out.println(post.getMediaList());			
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
}

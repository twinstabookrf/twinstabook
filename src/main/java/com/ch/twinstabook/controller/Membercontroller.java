package com.ch.twinstabook.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.twinstabook.model.Member;
import com.ch.twinstabook.service.MemberService;

@Controller
public class Membercontroller {
	@Autowired
<<<<<<< HEAD
	private MemberService mb;
		
=======
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("signUpForm")
	public String signUpForm() {
		return "join/signUpForm";
	}
	@RequestMapping("idChk")
	public String idChk(String member_id, Model model) {
		String msg = "";
		Member member = ms.select(member_id);
		if (member == null) msg = "사용 가능한 아이디 입니다.";
		else msg ="이미 사용중인 아이디 입니다.";
		model.addAttribute("msg", msg);
		return "join/idChk";
	}
	
	// 아이디 중복체크
	
//	@RequestMapping(value = "idChk" , produces="text/html;charset=utf-8")
//	@ResponseBody
//	public String idChk1(String member_id) {
//	String msg = "";
//	Member member = ms.select(member_id);
//	if ( member == null) msg = "사용 가능한 아이디 입니다.";
//	else msg ="이미 사용중인 아이디 입니다.";
//	
//	return msg;
//	
//	}
	
	@RequestMapping("signUp")
	public String signUp(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		//member는 화면에서 입력한 거, member2는 읽는데이터(아이디로 입력한 데이터가 있으면 중복)
		Member  member2 = ms.select(member.getMember_id());
		if(member2 == null) {
			String fileName = member.getFile().getOriginalFilename();
			member.setProfile_pic(fileName);
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(member.getFile().getBytes());
			fos.close();
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
		 if(member == null || member.getId_drop().equals("y"))
			 result = -1;    	//없는 아이디 
		 else if(passwordEncoder.matches(member.getPwd(),member2.getPwd())) {
		 result = 1; 			// 암호와 아이디 일
			 session.setAttribute("member_id", member.getMember_id());
		 }
		 model.addAttribute("result",result);
		return "join/login";
	}
	
	//포스트 컨트롤러와 충돌
/*	@RequestMapping("main")
	public String main(Member member, Model model, HttpSession session) {
		String id =(String)session.getAttribute("member_id");
		if(id != null && !id.equals(id)) {
			member = ms.select(id);
			model.addAttribute("member", member);
		}
		return "join/main";
	} */
	
	

	
	@RequestMapping("pwdHint")
	public String pwdHint() {
		
		return "join/pwdHint";
	}
	
>>>>>>> branch 'master' of https://github.com/twinstabookrf/twinstabook
}

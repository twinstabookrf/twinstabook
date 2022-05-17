package com.ch.twinstabook.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class Member {
	private String member_id;
	private String pwd;
	private String name;
	private String email;
	private String profile_pic;
	private Date reg_date;
	private String id_drop;
	private int ask;
	private String answer;
	private MultipartFile file; 
}

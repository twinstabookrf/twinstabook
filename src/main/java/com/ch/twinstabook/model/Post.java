package com.ch.twinstabook.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class Post {
	// DB
	private int postno;
	private String origin_member_id;
	private String member_id;
	private String content	;
	private Date crt_date;
	private Date mdf_date;
	private int views;
	private int likes;
	private int rts;
	
	// 업로드용(input의 name과 fileName이 일치 해야함)
	private MultipartFile file;
	
	// DB에 없는 데이터
	private String writer;
	private String profile_pic;
	private String originWriter;
	private String firstLike;	
	private List<Reply> replyList;
	private List<Media> mediaList;
}

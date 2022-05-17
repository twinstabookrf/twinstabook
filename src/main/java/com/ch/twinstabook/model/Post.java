package com.ch.twinstabook.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class Post {
<<<<<<< HEAD
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
=======
	private int postno;							// 게시글 번호
	private String origin_member_id;	// 원작자
	private String member_id;				// 작성자
	private String content	;					// 내용
	private Date crt_date;					// 작성일
	private Date mdf_date;					// 수정일
	private int views;							// 조회수
	private int likes;								// 좋아요
	private int rts;								// RT횟수
	// 업로드용(input의 name과 fileName이 일치 해야함)
	private MultipartFile file;
	//	파일명
	private String fileName;
>>>>>>> branch 'master' of https://github.com/twinstabookrf/twinstabook
}

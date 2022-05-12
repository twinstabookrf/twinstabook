package com.ch.twinstabook.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class Post {
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
}

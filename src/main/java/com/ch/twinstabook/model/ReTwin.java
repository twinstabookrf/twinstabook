package com.ch.twinstabook.model;

import java.sql.Date;

import lombok.Data;
@Data
public class ReTwin {
	private int reTwinno;					// RT번호
	private String name;					// 작성자 닉네임
//	private String rt_origin_name;	// 원작자 닉네임
	private int postno;						// 게시물번호
	private String rtContent;				// 내용	
	private Date crt_date;				// 작성일
	private Date mdf_date;				// 수정일
}
package com.ch.twinstabook.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Post {
	private int postno;
	private String origin_member_id;
	private String member_id;
	private String title;
	private String content	;
	private Date crt_date;
	private Date mdf_date;
	private int views;
	private int likes;
	private int rts;
}

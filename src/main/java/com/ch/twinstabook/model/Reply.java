package com.ch.twinstabook.model;

import java.util.Date;

import lombok.Data;
@Data
public class Reply {
	private int replyno;
	private String member_id;
	private int postno;
	private String content;	
	private Date crt_date;
	private Date mdf_date;
	private int likes;
	private int ref;
	private int ref_step;
	private int ref_level;
	
	private String writer;
}

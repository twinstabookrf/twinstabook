package com.ch.twinstabook.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;
@Data
public class Post {
	private int postno;
	private String origin_member_id;
	private String member_id;
	private String content	;
	private Date crt_date;
	private Date mdf_date;
	private int views;
	private int likes;
	private int rts;
	
	private String firstLike;
	private String writer;
	private String originWriter;
	private List<Reply> replyList;
}

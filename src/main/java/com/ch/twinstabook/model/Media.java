package com.ch.twinstabook.model;

import lombok.Data;

@Data
public class Media {
	private int mediano;
	private int postno;
	private String fileName;// ${path}/resources/{이 부분 확장자 포함}
}

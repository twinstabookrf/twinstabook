package com.ch.twinstabook.model;

import lombok.Data;

@Data
public class Media {
	private int mediano;			// 미디어 번호
	private int postno;				// 게시물 번호
	private String fileName;		// 파일명
}
=======
package com.ch.twinstabook.model;

import lombok.Data;

@Data
public class Media {
	private int mediano;			// 미디어 번호
	private int postno;				// 게시물 번호
	private String fileName;		// 파일명
}
>>>>>>> branch 'master' of https://github.com/twinstabookrf/twinstabook
=======
package com.ch.twinstabook.model;

import lombok.Data;

@Data
public class Media {
	private int mediano;
	private int postno;
	private String fileName;// ${path}/resources/{이 부분 확장자 포함}
}

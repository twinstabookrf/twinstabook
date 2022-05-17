drop table member;

create table member (
member_id varchar2(32)   primary key,					-- 아이디
pwd varchar2(50) not null,								-- 암호
name varchar2(32) not null,								-- 이름(별명)
email varchar2(32) not null,							-- 이메일
profile_pic varchar2(32),								-- 프로필사진
reg_date date not null,									-- 가입일
id_drop char(2)  default 'n' not null					-- 삭제여부

);
select * from member;
 
alter table member ADD ask number(5) not null;    		--이거 사용 !
alter table member ADD answer varchar2(50) not null;	--이거 사용 !

<<<<<<< HEAD
insert into member values('manho','1234','manho','jmkfmly@naver.com',null,sysdate,'n');

drop table post;

=======
delete from post;
create sequence seq_post;
>>>>>>> branch 'master' of https://github.com/twinstabookrf/twinstabook
create table post(
postno number(9)  primary key,							-- 게시글번호
origin_member_id varchar2(32) not null,					-- 원작자 아이디
member_id varchar2(32) not null ,						-- 작성자 아이디
<<<<<<< HEAD
--title varchar2(32) not null,							-- 제목
content	varchar2(2048),									-- 내용
crt_date date not null,									-- 작성일
mdf_date date,											-- 수정일
views number(9)	not null,								-- 조회수
likes number(9)	not null,								-- 좋아요
rts	number(9)	not null,								-- rt횟수
=======
content	varchar2(2048),							-- 내용
crt_date date not null,								-- 작성일
mdf_date date,									-- 수정일
views number(9)	not null,							-- 조회수
likes number(9)	not null,							-- 좋아요
rts	number(9)	not null,							-- rt횟수
>>>>>>> branch 'master' of https://github.com/twinstabookrf/twinstabook
CONSTRAINT fk_member_id foreign key(member_id) references member(member_id),
CONSTRAINT fk_origin_member_id foreign key(origin_member_id) references member(member_id)
);
select*from post;

insert into post values(1,'manho','manho','내용',sysdate,sysdate,0,0,0);

drop table reply;
select * from reply;
create table reply(
replyno	number(9)  primary key,							-- 댓글번호
member_id	varchar2(32) not null,						-- 작성자
postno number(38) unique not null,						-- 게시물번호
content	varchar2(512)	not null,						-- 내용	
crt_date date not null,									-- 작성일
mdf_date date,											-- 수정일
likes number(9) not null,								-- 좋아요
ref number(9) not null,
ref_step number(9) not null,
ref_level number(9)	not null,
CONSTRAINT fk_member_id2 foreign key(member_id) references member(member_id),
CONSTRAINT fk_postno foreign key(postno) references post(postno)
);

CREATE SEQUENCE  replyno_seq  START WITH 1 INCREMENT BY 1;
select * from user_SEQUENCEs;
drop sequence replyno_seq;

select * from REPLY;
insert into
	reply(replyno,member_id,postno,content,crt_date,mdf_date,likes,ref,ref_step,ref_level)
	values(1,'manho',1,'ss',sysdate,sysdate,0,0,0,0);
delete from reply;


drop table like_post;

create table like_post(
like_postno number(9) primary key,					-- 임시키
postno number(9) not null,							-- 게시물번호
member_id varchar2(32) not null,					-- 회원아이디
CONSTRAINT fk_postno2 foreign key(postno) references post(postno),
CONSTRAINT fk_member_id3 foreign key(member_id) references member(member_id)
);

drop table like_reply;

create table like_reply (
like_replyno number(9) primary key,					-- 임시키
replyno	number(9)	not null,							-- 댓글번호
member_id	varchar2(32)	not null,					-- 회원아이디
CONSTRAINT fk_replyno foreign key(replyno) references reply(replyno),
CONSTRAINT fk_member_id4 foreign key(member_id) references member(member_id)
);

drop table follow;

create table follow(
followno number(9) primary key,					-- 임시키
fwer_m_id varchar2(32) not null,						-- 팔로워
fwee_m_id varchar2(32) not null unique,					-- 팔로잉
CONSTRAINT fk_fwee_m_id foreign key(fwee_m_id) references member(member_id),
CONSTRAINT fk_fwer_m_id foreign key(fwer_m_id) references member(member_id)
);

<<<<<<< HEAD
drop table media;

create table media(
mediano number(9) primary key,							-- 임시키
postno number(9) ,										-- 게시물번호
fileName varchar2(32),									-- 파일명
=======
delete from media;
create sequence seq_media;
create table media( 
mediano number(9) primary key,               -- 미디어번호
postno number(9) not null,                     -- 게시물번호
fileName varchar2(32) not null,                  -- 파일명
>>>>>>> branch 'master' of https://github.com/twinstabookrf/twinstabook
CONSTRAINT fk_postno4 foreign key(postno) references post(postno)
);
<<<<<<< HEAD
create sequence seq_media;



drop table tag;
=======
select*from media;
>>>>>>> branch 'master' of https://github.com/twinstabookrf/twinstabook

create table tag(
tagno number(9) primary key,					-- 임시키
postno number(9) unique not null,						-- 게시물번호
tagName varchar2(32) primary key,						-- 태그명
CONSTRAINT fk_postno4 foreign key(postno) references post(postno)
);
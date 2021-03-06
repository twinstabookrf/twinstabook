drop table member;
delete from MEMBER;
create table member (
member_id varchar2(32)   primary key,					-- 아이디
pwd varchar2(100) not null,									-- 암호
name varchar2(32) not null unique,						-- 닉네임
email varchar2(32) not null,									-- 이메일
profile_pic varchar2(32) default 'pro.png',				-- 프로필사진
reg_date date not null,											-- 가입일
id_drop char(2) default 'n',									-- 삭제여부
ask number(5) not null,											-- 암호 찾기 질문
answer varchar2(50) not null	,								-- 암호 찾기 답
greeting varchar2(80)												-- 소개글
);

select * from member;


drop table post;
delete from post;
drop sequence seq_post;
create sequence seq_post;		-- 포스트 시퀀스

create table post(
postno number(9)  primary key,							-- 게시글번호
origin_name varchar2(32) not null,						-- 원작자 닉네임
member_id varchar2(32) not null ,							-- 작성자 아이디
content	varchar2(2048),											-- 내용
crt_date date not null,											-- 작성일
mdf_date date,														-- 수정일
likes number(9)	not null,										-- 좋아요
rts number(9)	not null,										-- rt횟수
CONSTRAINT fk_member_id foreign key(member_id) references member(member_id),
CONSTRAINT fk_origin_name foreign key(origin_name) references member(name)
);
select * from post;


drop table reply;
delete from reply;
select * from reply;
create table reply(
replyno	number(9)  primary key,							-- 댓글번호
member_id	varchar2(32) not null,						-- 작성자
postno number(38) unique not null,						-- 게시물번호
content	varchar2(512)	not null,							-- 내용	
crt_date date not null,											-- 작성일
mdf_date date,														-- 수정일
likes number(9) not null,										-- 좋아요
ref number(9) not null,
ref_step number(9) not null,
ref_level number(9)	not null,
CONSTRAINT fk_member_id2 foreign key(member_id) references member(member_id),
CONSTRAINT fk_postno foreign key(postno) references post(postno)
);


drop sequence replyno_seq;
CREATE SEQUENCE  replyno_seq  START WITH 1 INCREMENT BY 1;	-- 리플 시퀀스
select * from user_SEQUENCEs;
select * from REPLY;
--insert into
--	reply(replyno,member_id,postno,content,crt_date,mdf_date,likes,ref,ref_step,ref_level)
--	values(1,'manho',1,'ss',sysdate,sysdate,0,0,0,0);



drop table like_post;

create table like_post(
like_postno number(9) primary key,						-- 임시키
postno number(9) not null,									-- 게시물번호
member_id varchar2(32) not null,							-- 회원아이디
CONSTRAINT fk_postno2 foreign key(postno) references post(postno),
CONSTRAINT fk_member_id3 foreign key(member_id) references member(member_id)
);

drop table like_reply;

create table like_reply (
like_replyno number(32) primary key,					-- 임시키
replyno	number(9)	not null,									-- 댓글번호
member_id	varchar2(32)	not null,						-- 회원아이디
CONSTRAINT fk_replyno foreign key(replyno) references reply(replyno),
CONSTRAINT fk_member_id4 foreign key(member_id) references member(member_id)
);


drop table follow;

create table follow(					
followno number(9) primary key,							-- 임시키
fwer_m_id varchar2(32) not null,							-- 팔로워
fwee_m_id varchar2(32) not null unique,				-- 팔로잉
CONSTRAINT fk_fwee_m_id foreign key(fwee_m_id) references member(member_id),
CONSTRAINT fk_fwer_m_id foreign key(fwer_m_id) references member(member_id)
);

select * from FOLLOW;

drop table media;
delete from media;
drop sequence  seq_media;
create sequence seq_media;	-- 미디어 시퀀스

create table media(
mediano number(9) primary key,							-- 임시키
postno number(9) ,												-- 게시물번호
fileName varchar2(70),											-- 파일명
CONSTRAINT fk_postno4 foreign key(postno) references post(postno)
);

select *from media;


drop table reTwin;
delete from reTwin;
select * from reTwin;
drop sequence seq_reTwin;
create sequence seq_reTwin;		-- RT 시퀀스
create table reTwin(
reTwinno	number(9)  primary key,						-- rt번호
name	varchar2(32) not null,								-- 작성자 닉네임
postno	number(38) not null,									-- 게시물번호
rtContent	varchar2(2048),										-- 내용	
crt_date	date not null,										-- 작성일
mdf_date	date,													-- 수정일
CONSTRAINT fk_name foreign key(name) references member(name),
CONSTRAINT fk_postno3 foreign key(postno) references post(postno)
);
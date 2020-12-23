select * from tab;
select * from member;
drop table member;

create table member(
member_id varchar2(50) primary key not null,	--아이디
member_password varchar2(50) not null,			--비번
member_name varchar2(50) not null,				--이름
member_address varchar2(50) not null,			--주소
member_phone varchar2(100) not null,			--전화번호
member_email varchar2(50),						--메일
member_admin number default 1 not null,			--계정(0=관리자,1=일반)
member_hint varchar2(50) not null,				--비밀번호 힌트
member_answer varchar2(50) not null				--비밀번호 힌트 답
);  

insert into member values('admin','0000','愿�由ъ옄','�꽌�슱','000-0000-0000','admin@admin.com',0,'�굹�쓽 痍⑤�몃뒗?','肄붾뵫');
insert into member values('abcd','0000','test','test','000-0000-0000','test@test.com',1,'취미','코딩');

INSERT INTO MEMBER
			VALUES('aa','1111','aa','서울',
				'010-0000-0000','aa@aa.com',1,'1','1');

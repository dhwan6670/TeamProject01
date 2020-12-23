create table board(
board_num number not null primary key,
board_id varchar2(50) not null,
board_name varchar2(50) not null,
board_code varchar2(10) not null,
board_title varchar2(100) not null,
board_content clob,
board_content2 blob,
board_hit number not null,
board_date date not null,
board_rec number not null,
board_reply number not null,
board_ref number not null,
board_step number default 0 not null
);
select * from board where board_code='n';
create sequence board_seq increment by 1 start with 1 nocache nocycle;
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/dhwan6670/TeamProject.git
drop sequence board_seq;

--짤게시판 댓글
 create table pic_comment(
 	board_num number not null,
 	pic_com_num number not null primary key,
 	pic_comment varchar2(1000) not null,
 	pic_com_date date not null,
 	constraint pic_com_num foreign key(board_num) references board(board_num)
 );
 create sequence pic_com_seq start with 1;
--댓글
 create table board_comment(
 	comment_num number primary key,
 	comment_boardnum number not null,
 	comment_id varchar2(15),
 	comment_date date,
 	comment_parent number,
 	comment_content varchar2(1000) not null,
 	constraint replyfk foreign key(comment_boardnum) references board(board_num) on delete cascade
 );
create sequence REPLY_NUM increment by 1 start with 1 nocache nocycle;
drop table board_comment;
--소모임게시판 리플테이블
create table party_ref(
ref_num number not null,
ref_id varchar2(50) not null,
ref_name varchar2(50) not null,
ref_content varchar2(500) not null,
ref_date date not null,
ref_step number not null,
ref_lev number not null,
ref_pseq number not null
);

create sequence party_ref_seq increment by 1 start with 1 nocache nocycle;

--게시물번호와 추천한 아이디 저장
create table party_rec(           
rec_num number not null,
rec_id varchar(20) not null
);

drop table party_rec;
drop table board;
drop table party_ref;
drop sequence party_ref_seq;


select * from tab;
select * from board;
select * from PARTY_REF;

SELECT ROWNUM,BOARD_CODE,BOARD_NUM,BOARD_TITLE,BOARD_ID,BOARD_REC FROM BOARD
WHERE ROWNUM<=5 ORDER BY BOARD_REC DESC;

create table evaluate(
eval_num number not null,
eval_name varchar2(50) not null,
eval_game varchar2(100) not null,
eval_star number not null,
eval_content varchar2(500) not null,
eval_date date
);

create sequence eval_seq increment by 1 start with 1 nocache nocycle;
select * from evaluate;
drop table evaluate;
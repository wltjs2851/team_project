create table tbl_user(
    userid varchar2(20) primary key,
    userpw varchar2(20) not null,
    username varchar(10) not null,
    email varchar(50) not null,
    address varchar(100) not null,
    gender varchar(10) not null,
    nickname varchar(20) not null,
    age number(3) not null,
    u_point number default 0,
    u_pic varchar2(100)
);

create table tbl_point_code(
    pcode number primary key,
    pdesc varchar2(100) not null
);

create table tbl_point(
    pno number primary key,
    point number default 0,
    userid REFERENCES tbl_user(userid),
    pcode number references tbl_point_code(pcode),
    pdate date default sysdate
);

create table tbl_group(
    gno number primary key,
    g_name varchar2(50) not null,
    userid references tbl_user(userid),
    excercise_type varchar(50) not null,
    g_attend number not null,
    g_intro varchar2(500) not null,
    g_location varchar2(100) not null,
    g_regdate date default sysdate,
    g_pic varchar2(500)
);

create table tbl_group_board(
    gbno number primary key,
    gb_title varchar2(100) not null,
    gb_content varchar2(4000) not null,
    userid references tbl_user(userid),
    gb_notice varchar2(10) default 'n',
    gb_regdate date default sysdate,
    gb_like number default 0,
    gb_pic varchar2(500)
);

create table tbl_group_board_comment(
    gbcno number primary key,
    gbc_content varchar2(500),
    gbno references tbl_group_board(gbno),
    userid references tbl_user(userid),
    gbc_regdate date default sysdate
);

create table tbl_recipe(
    rno number primary key,
    r_title varchar2(100) not null,
    r_content varchar2(4000) not null,
    userid references tbl_user(userid),
    r_regdate date default sysdate,
    r_pic varchar2(500),
    r_viewcnt number default 0,
    r_like number default 0
);

create table tbl_rcomment(
    rcno number primary key,
    rno references tbl_recipe(rno),
    rc_comment varchar2(500) not null,
    userid references tbl_user(userid),
    rc_regdate date default sysdate
);

create table tbl_userroutine(
    uno number primary key,
    u_title varchar2(100) not null,
    u_content varchar2(4000) not null,
    userid references tbl_user(userid),
    u_regdate date default sysdate,
    u_pic varchar2(500),
    u_viewcnt number default 0,
    u_like number default 0
);

create table tbl_ucomment(
    ucno number primary key,
    uno references tbl_userroutine(uno),
    rc_comment varchar2(500) not null,
    userid references tbl_user(userid),
    u_regdate date default sysdate
);

create table tbl_free(
    fno number primary key,
    f_title varchar2(100) not null,
    f_content varchar2(4000) not null,
    userid references tbl_user(userid),
    f_regdate date default sysdate,
    f_pic varchar2(500),
    f_viewcnt number default 0,
    f_like number default 0,
    fcode varchar(50) not null
);

create table tbl_fcomment(
    fcno number primary key,
    fno references tbl_free(fno),
    fc_comment varchar2(500) not null,
    userid references tbl_user(userid),
    f_regdate date default sysdate
);

create table tbl_fcategory_code(
    fcode number primary key,
    fdesc varchar2(100) not null
);

create table tbl_kcal(
    kno number primary key,
    k_name varchar2(100) not null,
    k_time varchar2(50) not null,
    kcal varchar2(50) not null
);

create table tbl_recommend(
    reno number primary key,
    re_content varchar2(400) not null,
    re_title varchar2(100) not null,
    re_regdate date default sysdate,
    re_like number default 0,
    re_viewcnt number default 0
);

create table tbl_reccomment(
    recno number primary key,
    reno references tbl_recommend(reno),
    re_comment varchar2(500) not null,
    userid references tbl_user(userid),
    re_regdate date default sysdate
);

create table tbl_calendar(
    calendar_date date default sysdate,
    cano number primary key,
    calendar_content varchar2(500),
    userid references tbl_user(userid)
);

--그룹 번호 시퀀스 추가 -> 김지선
create sequence seq_group_gno;

--그룹 현재 참석 인원 컬럼 추가 -> 김지선
alter table tbl_group add g_present number default 1;

--유저 테이블에 그룹 번호 컬럼 추가-> 김지선
alter table tbl_user add gno REFERENCES tbl_group(gno);
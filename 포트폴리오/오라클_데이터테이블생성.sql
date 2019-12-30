create table tbl (
bno number(5) not null,
title varchar2(50) not null,
content varchar2(2000),
writer varchar(15),
regdate date default sysdate,
updatedate date default sysdate,
cnt number(13),
primary key(bno));

commit;
drop table tbl;

insert into tbl values(1,'글제목지정','글양식지정','작가1',default,default,0);
insert into tbl values(2,'글제목지정','글양식지정','작가2',default,default,0);
insert into tbl values(3,'글제목지정','글양식지정','작가3',default,default,0);
insert into tbl values(4,'글제목지정','글양식지정','작가4',default,default,0);
insert into tbl values(5,'글제목지정','글양식지정','작가5',default,default,0);

create table book(
bcd varchar(20),
fcd varchar(20),
title varchar(50),
writer varchar(20),
publish varchar(30),
price varchar(30),
primary key(bcd)
);

insert into book values('101','aaa','책제목1','김작가','가출판사','13000');
insert into book values('201','bbb','책제목2','이작가','나출판사','20000');
insert into book values('202','ccc','책제목3','박작가','다출판사','15000');
insert into book values('301','ddd','책제목4','최작가','라출판사','32000');
insert into book values('401','eee','책제목5','송작가','마출판사','54000');
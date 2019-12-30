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

insert into tbl values(1,'����������','�۾������','�۰�1',default,default,0);
insert into tbl values(2,'����������','�۾������','�۰�2',default,default,0);
insert into tbl values(3,'����������','�۾������','�۰�3',default,default,0);
insert into tbl values(4,'����������','�۾������','�۰�4',default,default,0);
insert into tbl values(5,'����������','�۾������','�۰�5',default,default,0);

create table book(
bcd varchar(20),
fcd varchar(20),
title varchar(50),
writer varchar(20),
publish varchar(30),
price varchar(30),
primary key(bcd)
);

insert into book values('101','aaa','å����1','���۰�','�����ǻ�','13000');
insert into book values('201','bbb','å����2','���۰�','�����ǻ�','20000');
insert into book values('202','ccc','å����3','���۰�','�����ǻ�','15000');
insert into book values('301','ddd','å����4','���۰�','�����ǻ�','32000');
insert into book values('401','eee','å����5','���۰�','�����ǻ�','54000');
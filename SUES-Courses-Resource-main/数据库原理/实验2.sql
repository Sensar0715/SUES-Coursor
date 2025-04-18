create database stu
use stu
create table S
(sno varchar(6) primary key not null,
sname varchar(20) not null,
sex varchar(2) null,
age int null,
sdept varchar(20) null,
)
create table C
(cno varchar(8) primary key not null,
cname varchar(20) not null,
pcno varchar(8) null,
credit int default 4 null,
)
create table SC
(cno varchar(8) not null,
sno varchar(6) not null,
grade int null,
primary key (cno,sno)
)
alter table C drop column pcno 
alter table C add tname varchar(10) null
alter table S alter column sdept varchar(30) null
alter table S add constraint sex check(sex in ('��','Ů'))
alter table S add constraint df_age default 18 for age 
alter table SC add constraint SC1 foreign key(sno) references s(sno)
alter table SC add constraint SC2 foreign key(cno) references c(cno)
/*��12��͵�6��һ��*/
drop table S,SC,C

create table S
(sno varchar(6) primary key not null,
sname varchar(20) not null,
sex varchar(2) null check (sex in ('��','Ů')) default '��',
age int null default 18,
sdept varchar(30) null,
)
create table C
(cno varchar(8) primary key not null,
cname varchar(20) not null,
tname varchar(10) null,
credit int default 4 null,
)
create table SC 
(cno varchar(8) not null,
sno varchar(6) not null,
grade int null check (grade between 0 and 100),
primary key (cno,sno)
)

insert into S
values ('S1','����','Ů',20,'��ѧ'),
	   ('S2','����','Ů',19,'�����'),
	   ('S3','����','��',22,'����'),
	   ('S4','����','��',19,'��ѧ'),
	   ('S5','�ν�','��',21,'����'),
	   ('S6','�ܲ�','��',18,'�����')
insert into C
values ('C2','��ѧ','����',4),
	   ('C4','����','�������',3),
	   ('C3','����','���ݿ�',4),
	   ('C1','����','����ϵͳ',4),
	   ('C5','�ν�','C����',4)

insert into SC
values ('C1','S1',80),('C1','S2',85),('C1','S3',90),('C1','S4',75),('C1','S5',70),('C1','S6',90),
	   ('C2','S1',70),('C2','S2',NULL),('C2','S3',85),('C2','S5',60),('C2','S6',NULL),('C3','S1',85),
	   ('C3','S3',95),('C3','S4',NULL),('C3','S5',80),('C3','S6',90),('C4','S1',90),('C4','S2',NULL),
	   ('C4','S4',70),('C5','S1',70),('C5','S5',65),('C5','S6',NULL)

select * from S
select * from C
select * from SC

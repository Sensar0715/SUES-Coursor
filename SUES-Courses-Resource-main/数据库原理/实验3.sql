use stu

select * from S
select sno,sname,sex,age,sdept from S

/* 2 */
select sno,sname,sdept from S

/* 3 */
select distinct sno from SC

/* 4 */
select * from C
where cno in('c1','c3');

/* 5 */
select cno,cname from c 
where tname='����';

/* 6 */
select sno,sname from S
where sdept='��ѧ' and age<20 and sex='��';

/* 7 */
select sno,cno from SC
where grade is null;
	
/* 8 */
select sname,2020-age as '�������'from S;

/* 9 */
select sno,sname,sex,age from S 
where sdept='�����' and age between 20 and 30 and sex='��';

/* 10 */
select distinct sno from SC 
where cno is not null;

/* 11 */
select sno,sname from S 
where  age > 23 and sex='��';

/* 12 */
select sno,grade from SC 
where cno='c1'
order by grade desc;

/* 13 */
select sno,cno,grade from SC 
where grade is not null
order by cno asc,grade desc;

/* 14 */
select * from S 
where sname like '��%' and sex='��';

/* 15 */
select * from C 
where cname like '%���ݿ�%';

/* 16 */
select AVG(grade) as 'c1�γ�ƽ���ɼ�' from SC
where cno='c1';

/* 17 */
select MAX(grade) as 'c4�γ���߷���' from SC
where cno='c4';

/* 18 */
select sex as '�Ա�',AVG(age) as 'ƽ������',MAX(age) '�������' ,'��С����' =MIN(age) from S
group by sex;

/* 19 */
select count(cno) as'ѡ��c4��ѧ��������' from SC
where cno='c4';

/* 20 */
select AVG(grade) as'ѡ��c3��ѧ��ƽ���ɼ�' from SC
where cno='c3';

/* 21 */
select MAX(grade) as'ѡ��c3��ѧ����߷���' from SC
where cno='c3';

/* 22 */
select count(distinct cno) as'��ѧ��ѡ�޵Ŀγ�����' from SC;

/* 23 */
select cno,count(*) as'ѡ������'from SC
group by cno
having count(*)>5;

/* 24 */
select cno,count(sno) as 'ѡ������' from SC
group by cno

/* 25 */
select sno , count(*) as'ѡ������' from SC
group by sno
having count(*)>4;

/* 26 */
select cno,count(sno)as'ѡ������' from SC
group by cno
having count(*)>10
order by 2 desc ,cno asc;

/* 27 */
select sno,SUM(grade)as '�ܳɼ�'from SC
where grade >= 60 
group by sno 
having count (*)>4
order by 2 desc

/* 28 */
select sno,count(cno)as'ѡ������' from SC
group by sno 
having count (cno)>3

/* 29 */
select sc.sno,sc.cno,c.tname from C, SC
where sc.cno =c.cno and sno='s3' 

/* 30 ������ʦ���ڿγ̵�ÿ�ſγ̵Ŀκţ�ѧ��ƽ���ɼ� */
select sc.cno,AVG(sc.grade) as'ƽ���ɼ�' from SC
where sc.cno in (select c.cno from c where tname like '��%')
group by sc.cno

/* 31 */
select s.sname as 'ѧ������',c.cname '�γ���','�ɼ�'=sc.grade from C,S,SC
where s.sno=sc.sno and c.cno=sc.cno 

/* 32 */
select sc.sno,cname,tname from SC,C
where sc.sno='s3' and sc.cno=c.cno

/* 33 */
select distinct sname from S,SC,C
where s.sno=sc.sno and sc.cno=c.cno and sex='Ů' and tname='����'

/* 34 */
select s.sname as '����',c.cno as '�γ̺�',grade as'�ɼ�' from S,C,SC
where s.sno=sc.sno and c.cno=sc.cno

/* 35 */
select s.sno,sname from S,C,SC
where c.cname='���ݿ�' and s.sno=sc.sno and c.cno=sc.cno

/* 36 */
select s.sno,sname,grade from S,C,SC
where c.cno='C1' and s.sno=sc.sno and c.cno=sc.cno

/* 37 */
select s.sno,sname from S,C,SC
where c.tname='��һ' and s.sno=sc.sno and c.cno=sc.cno and sex='Ů'

/* 38 */
select sname from S,C,SC
where c.cname='�������' and s.sno=sc.sno and c.cno=sc.cno and grade>=90

/* 39 */
select s.sno,sname,sdept,count(sc.cno) as 'ѡ������',AVG(grade)as'ƽ����' from S,C,SC
where s.sno=sc.sno and c.cno=sc.cno 
group by s.sno,sname,sdept
having count(sc.cno)>3

/* 40 */
select c.cname,AVG(grade)as'�ÿγ�ƽ���ɼ�' from C,S,SC
where c.tname='����' and c.cno=sc.cno 
group by c.cname

/* 41 */
select AVG(age) as 'ѡ��c4�γ�ѧ����ƽ������' from S,SC
where sc.cno='c2'and s.sno=sc.sno

/* 42 */
select x.sname from s x,s y
where y.sname='����' and x.sno>y.sno and x.age<y.age

/* 43 */
select sname,age from S
where sex='��' and age>ALL(select age from s where sex='Ů')

/* 44 */
select * from S
where age >=all(select age from s)

/* 45 */
select sname,age from S
where age >(select AVG(age) from s where sex='Ů')and sex='��'

/* 46 */
select sname,age from S
where age >all(select age from s where sex='Ů')and sex='��'

/* 47 */
select sname,age,sex from S
where age <(select age from S where sname='����')

/* 48 */
select sno from SC,C
where grade<(select AVG(grade) from SC,C where sc.cno=c.cno and c.cname='��ѧ')and c.cname='��ѧ'and sc.cno=c.cno

/* 49 */
select cno from C
where cno not in (select cno from sc,s where sname='����'and s.sno=sc.sno)

/* 50 */
select sname from S,SC
where sc.cno='C1' and sc.sno in (select sc.sno from sc where sc.cno='C2')and sc.sno=s.sno

/* 51 */
select sname from s,sc,c
where grade>=(select MAX(grade)from sc,c 
where cname='Ӣ��'and sc.cno=c.cno)and sc.sno=s.sno and c.cname='Ӣ��'and c.cno=sc.cno

/* 52 */
select sname from S
join sc on sc.sno=s.sno
join c on c.cno=sc.cno 
where sc.sno in (select sno from SC group by sno having count(sno)=1) and c.cno='C2'

/* 53 */
select * from S
where not exists (select * from c where not exists (select * from sc where sc.sno=s.sno and sc.cno=c.cno))

/* 54 */
select sc.sno,sname,sc.cno,grade from S,SC
where grade>80

/* 55 */
select cno,cname from C
where not exists (select * from s where not exists (select * from sc where sc.sno=s.sno and sc.cno=c.cno))

/* 56 */
select s.sno from C,S,SC
where c.tname='����' and c.cno=sc.cno and s.sno=sc.sno 
group by s.sno

/* 57 */
select sname from 
(
select sno,count(cno) as num from sc where cno in (
select cno from s join sc on s.sno=sc.sno and s.sno='s2'
)
group by sno
) t2
join (select count(cno) num from s join sc on s.sno=sc.sno and s.sno='s2') t1 on t2.num = t1.num
join s on s.sno=t2.sno

/* 58 */
insert into s(sno,sname,age)
values('S9','����','18')
delete from S where sname='����'
select * from S

/* 59 */
create table student 
( 
sno varchar(8) not null,
sname varchar(8) not null,
sex varchar(8) not null
)
insert into student
select sno,sname,sex from S
where sno not in (select sno from sc where grade<80)
SELECT * FROM student

/* 60 */
insert into c(cno,cname,credit,tname)
values('C12','��ѧ����','2',NULL)
SELECT * FROM C

/* 61 */
create table newTable 
( 
cno varchar(8) not null,
cname varchar(8) not null,
grade int
)
insert into newTable
select c.cno,c.cname,AVG(grade) from C,SC
where c.cno=sc.cno 
group by c.cno,c.cname
SELECT * FROM newTable

/* 62 */
delete from SC
where grade is null
SELECT * FROM SC

/* 63 */
delete from SC
where sno in (select sno from S where sname='����')

/* 64 */
delete from SC
where sno='s1'
delete from s
where sno='s1'


/* 65 */
delete from sc
where cno='c1'and sno in (select sno from s where sex='��')

/* 66 */
delete from SC
where sno='s8'
delete from S
where sno='s8'
SELECT * FROM SC

/* 67 */
delete from sc
where sno in (select sno from s where sname='����')
delete from s
where sname='����'

/* 68 */
update s set age = '22' where sno='s4'

/* 69 */
update sc set grade = grade*(1+0.05) where cno='c3'

/* 70 */
update sc set grade = grade*(1+0.04) where sno in (select sno from s where sex='��')and cno in (select cno from c where cname='��һ')

/* 71 */
update sc set grade =NULL where grade <60 and cno in (select cno from c where cname='���ݿ�') 

/* 72 */
update sc set grade = grade*(1+0.15) where sno in (select sno from s where sex='Ů') and grade<(select AVG(grade) from SC)
SELECT * FROM SC
/* 73 */
update sc set grade =grade*(1+0.04) where cno='c4' and grade >75;
update sc set grade = grade*(1+0.05) where cno='c4' and grade <=75
/* 74 */
update sc set grade=grade + 2 where cno in(select cno from c where cname='%Ӣ��%')
/* 75 */


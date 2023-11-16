
create table ezenBoard(
	idx int not null,
	memberID varchar(20) not null,
	title varchar(20) not null,
	content varchar(100) not null,
	writer varchar(20) not null,
	indate datetime default now(),
	count int default 0,
	boGroup int,
	boSequence int,
	boLevel int,
	boUsable int,
	primary key(idx)
	
);

drop table ezenBoard;

create table ezenMember(
	memberID varchar(50) not null,
	memberPwd varchar(50) not null,
	memberName varchar(50) not null,
	memberPhone varchar(50) not null,
	memberAddr varchar(100),
	latitude DECIMAL(13,10),
	longtidue DECIMAL(13,10),
	primary key(memberId)
);

insert into ezenMember(memberID, memberPwd, memberName, memberPhone) values('aaaa','1234','이창표','010-2222-3333');
insert into ezenMember(memberID, memberPwd, memberName, memberPhone) values('bbbb','1234','김영재','010-2222-4444');
insert into ezenMember(memberID, memberPwd, memberName, memberPhone) values('cccc','1234','지예솔','010-2222-5555');

select *from ezenMember;

select *from ezenBoard;

select IFNULL(max(idx)+1,1) from ezenBoard; --널이면 1로 널이 아니면 +1로
select IFNULL(MAX(boGroup)+1,0) from ezenBoard;


insert into ezenBoard
select IFNULL(max(idx)+1,1), 'ezen01', '스프링1', '스프링1', '이창표',
now(),0,IFNULL(MAX(boGroup)+1,0),0,0,1 from ezenBoard;




insert into ezenBoard
select IFNULL(max(idx)+1,1), 'ezen02', '스프링2', '스프링2', '김영재',
now(),0,IFNULL(MAX(boGroup)+1,0),0,0,1 from ezenBoard;




insert into ezenBoard
select IFNULL(max(idx)+1,1), 'ezen03', '스프링3', '스프링3', '지예솔',
now(),0,IFNULL(MAX(boGroup)+1,0),0,0,1 from ezenBoard;




delete from ezenBoard;


commit;

select *from ezenBoard;
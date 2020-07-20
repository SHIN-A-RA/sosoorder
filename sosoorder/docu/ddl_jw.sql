select * from admin;
select * from member;
select * from MENU;
select * from seat;
insert into admin values('test','test',111,111,'예담학원','예담');
insert into menu values(1,'햇반',1300,'사진','밥','비벼먹을 때 씁니다',0,'test');
insert into menu values(2,'사이다',1000,'사진2','음료','청량감',1,'test');
insert into seat values(1,'test', 1);

commit;

insert into point values(1,sysdate, 12, 'test', 1);
insert into point values(2,sysdate, 50, 'test', 1);
insert into point values(3,sysdate, 50, 'test2', 1);

insert into point values(4,sysdate, 12, 'test', 2);
insert into point values(5,sysdate, 50, 'test', 2);
insert into point values(6,sysdate, 50, 'test2', 2);


select * from point;

select me.email 
from member me, point po, admin ad
where me.membernum = po.membernum
	and ad.storeid = po.storeid;









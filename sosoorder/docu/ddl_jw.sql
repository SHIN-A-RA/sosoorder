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


select * from orderCpt;

alter table orderCpt drop column ordernum;
alter table orderCpt add (ordernum number(10));

CREATE SEQUENCE seq_ordercpt;

INSERT INTO orderCpt(menuOrderNum, menuNum, orderCount)
		select seq_ordercpt.nextval, A.*
		from (select '1','2' from dual) as A
		
		select 1,2 from dual
		
SELECT MAX(orderNum) "orderNumMax" FROM orderCpt


CREATE OR REPLACE VIEW memberadmin
AS
SELECT a.storeId, m.membernum
FROM point p, admin a, member m
where p.storeId = a.storeId and m.membernum = p.membernum;

select * from memberadmin;

select * from member;
select * from point;
insert into point('1',sysdate, '20', 'test')


select * from menu;
select * from admin;
update admin set storemenu = '밥|음료|분식' where storeId = 'test';

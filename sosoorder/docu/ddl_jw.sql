CREATE VIEW orderAll_view AS(
select m.menuName, p.payday, a.storeName, o.orderCount, me.phone, a.storeId, o.PAYNUM
from payment p, admin a, menu m, ordercpt o, member me
where p.memberNum = me.memberNum and o.paynum = p.paynum and m.menunum = o.menunum and a.storeid = m.storeid
)

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

select c.serialnum, c.expstart, c.expend, c.discount, a.storeName from coupon c, admin a where c.storeId = a.storeId AND c.storeId = ?;

insert into coupon(serialNum, expStart, expEnd, discount)
		set('123213', to_date('20091023', 'yyyymmdd'), to_date('20150520','yyyymmdd'), 1000,'test')

select * from coupon;		
alter table coupon MODIFY(serialnum varcher2(20));
delete from coupon where serialNum ='12';


SELECT * FROM MENU where storeid = 'test' and menucategory = 
(select regexp_substr(storemenu,'[^|]+',1,1) from admin where storeid ='test');


UPDATE coupon
		SET
		expStart = to_date('20200717' , 'YYYYMMDD'),
		expEnd = to_date('20200720', 'YYYYMMDD'),
		discount = '3000'
		WHERE
		serialNum = 'IBJZXAAT'
		
		select * from COUPON
		
		
select * from POPUP

alter table POPUP drop column popchack;
alter table POPUP drop column START_DAY;
alter table POPUP add (popcheck varchar2(2));
alter table POPUP MODIFY(popImage varchar2(1000));

select * from userCoupon;

select * from seat;
alter table seat add(userCheck varchar2(2));


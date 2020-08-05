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

select * from call



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

select m.menuName, o.orderCount ,m.menuPrice
from orderCpt o, menu m
where o.menuNum = m.menuNum AND o.orderNum=1;

select * from payment where paynum = 7;

select distinct payday, storename, phone, storeAddr 
from orderall_view
where paynum =  $P{payNum} 

select phone "id", 'ROLE_USER'
from member
UNION
select storeId "id", 'ROLE_ADMIN'
from admin


select SUM(nvl(orderStar, 0))/SUM(nvl(orderCount, 0)) "orderStar", menuNum
from OrderCpt
where orderStar is not null
group by menuNum;

select * from menu
where
 storeId = 'test' 

 
SELECT
round(AVG(o.orderStar),0) "orderStar",
m.menuName "menuName",
m.menuNum "menuNum",
m.storeId "storeId"
FROM MENU m, OrderCpt o
where
m.menuNum = o.menuNum(+)
AND m.storeId = 'test' 
group by m.menuNum ,m.menuName,
m.menuPrice, m.menuImage, m.menuCategory, m.menuContents, m.menuCheck, m.storeId;




SELECT  e.empName,
             to_char(w.workStart, 'dy') AS week,
             to_char(w.workStart,'mm/dd') AS month, 
           to_char(w.workStart,'hh24:mi') AS workStart, 
       to_char(w.workEnd,'hh24:mi') AS workEnd,
           TRUNC(( TO_DATE(w.workend,'HH24:MI:SS') -TO_DATE(w.workstart,'HH24:MI:SS')),0) AS sumTime
     FROM employees e, work w
     WHERE w.empNum = e.empNum 
     AND storeId = 'test'
     AND to_char(w.workend,'YYYY-MM')='2020-07'
     AND e.empNum = 41;
     
     
     SELECT  e.empName,
             to_char(w.workStart, 'dy') AS week,
             to_char(w.workStart,'mm/dd') AS month, 
           to_char(w.workStart,'hh24:mi') AS workStart, 
       to_char(w.workEnd,'hh24:mi') AS workEnd,
       TRUNC(
 				(TO_DATE(TO_CHAR(w.workend,'HH24:MI:SS'), 'HH24:MI:SS')
 				-TO_DATE(TO_CHAR(w.workstart,'HH24:MI'), 'HH24:MI:SS')
 				)*(24),0
 			) AS sumTime   
     FROM employees e, work w
     WHERE w.empNum = e.empNum 
     AND e.storeId = 'test'
     AND to_char(w.workend,'YYYY-MM')='2020-07'
     AND e.empNum = 41;
     
     select   
     				TO_DATE(TO_CHAR(workend), 'HH24:MI:SS')
     				-TO_DATE(TO_CHAR(workstart), 'HH24:MI:SS')
     				
     from work
     
     select workend, workstart
     from work
     
     select * from work
     
select * from call
alter table call add (callcheck varchar2(2));
alter table call add (storeId varchar2(30));
ALTER TABLE call ADD FOREIGN KEY (storeId) REFERENCES admin (storeId);

CREATE SEQUENCE seq_call;

INSERT INTO call
         (callNum,
		 seatNum,
		 callContents,
		 callCheck,
		 storeId)
      VALUES
         (seq_call.nextval,
        '1',
         '12',
         '1',
         'test')
         
 select * from seat;
 select * from call;
 select * from orderCpt;
 select * from admin;
 
 alter table call drop constraint CALL_FK;

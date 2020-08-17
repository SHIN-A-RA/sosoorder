
CREATE SEQUENCE seq_ordercpt; .nextval;
CREATE SEQUENCE seq_parkco;
/*쿠폰 적용 누르면 쿠폰할인금액 받아오기*/
select c.discount 
FROM COUPON C JOIN USERCOUPON U ON(C.SERIALNUM = U.SERIALNUM)
WHERE C.storeId = 'test' 
   AND U.memberNum = 1
   AND U.usecheck = 0;
   ㅇ
   
/* orderCpt insert */
insert into ORDERCPT values(2, null, 2, 3, 1, null)

/* 주문메뉴 */
SELECT m.menuName, o.orderCount, m.menuPrice*o.orderCount AS price
FROM menu m JOIN orderCpt o ON (m.menuNum = o.menuNum)
WHERE m.storeId = 'test' 
	AND o.orderNum= 46;
	
alter table point add(pointCheck varchar2(2)); 

/* 총적립금 */
select sum(point*pointCheck) AS totalPoint 
from point
where storeId = 'test'
	and memberNum = 1;
	
/* 사용 가능한 쿠폰 조회*/	
select c.serialNum, c.expStart, c.expEnd, c.discount, c.storeId, u.useCheck
FROM COUPON c JOIN USERCOUPON u ON (c.serialNum = u.serialNum)
WHERE c.storeId = 'test'
AND c.expEnd > sysdate
AND u.usecheck = 0
AND u.memberNum = (SELECT memberNum FROM member WHERE phone = '123')


/* 사용 가능 쿠폰조회 조인3개*/
select c.serialNum, c.expStart, c.expEnd, c.discount, c.storeId, u.useCheck, a.storeName
FROM USERCOUPON u 
INNER JOIN COUPON c 
	ON (u.serialNum = c.serialNum)
INNER JOIN ADMIN a
	ON (c.storeId= a.storeId)
WHERE c.storeId = 'test'
AND c.expEnd > sysdate
AND u.usecheck = 0;

/* 테이블 조인 3개 방법2 */
select c.serialNum, c.expStart, c.expEnd, c.discount, c.storeId, u.useCheck, a.storeName
FROM USERCOUPON u , COUPON c, ADMIN a
WHERE u.serialNum = c.serialNum
	AND c.storeId= a.storeId
	AND c.storeId = 'test'
	AND c.expEnd > sysdate
	AND u.usecheck = 0;


alter table payment drop column amount;

alter table delivery add(cellphone varchar2(30));

(SELECT NVL(max(PAYNUM), 0)+1 FROM PAYMENT)

/* 결제테이블 인서트 */
insert into PAYMENT 
values(
	(SELECT NVL(max(PAYNUM), 0)+1 FROM PAYMENT), 
	'0', 
	sysdate, 
	'200', 
	'1000', 
	(SELECT seatNum FROM SEAT WHERE SEAT = '6'), 1, 27000, '0');
	
/*결제 프로시저*/
create or replace PROCEDURE PAYMENT_PROC
 ( p_serialNum IN usercoupon.serialNum%TYPE,
  p_pointUse IN payment.pointUse%TYPE,
  p_storeId IN admin.storeId%TYPE,
  p_phone IN member.phone%TYPE
 
)
IS

BEGIN
	update ORDERCPT 
	set PAYNUM= (SELECT MAX(PAYNUM) FROM PAYMENT)
	where ORDERNUM = (SELECT MAX(ORDERNUM) FROM ORDERCPT);   
	
	update USERCOUPON 
	set USECHECK = '1'
	WHERE SERIALNUM = p_serialNum;
	
	insert into POINT ("POINTNUM", "POINTDATE", "POINT", "STOREID", "MEMBERNUM", "POINTCHECK") 
				values(
				      (SELECT NVL(max(POINTNUM), 0)+1 FROM POINT), 
				      sysdate, 
				      p_pointUse,  
				      p_storeId,
				      (SELECT memberNum FROM member WHERE phone = p_phone),
				       '-1');
	COMMIT;
	END;
	
	select totalpay *(3/100) FROM payment WHERE payNum = (select distinct payNum FROM orderCpt WHERE orderNum= '46') 
	
	delete from point where point is null;
	update POINT set MEMBERNUM=1 where MEMBERNUM=0
	
	/* 결제 주문 지우기*/
	delete from PAYMENT where payNum BETWEEN 10 and 63;
	delete from ordercpt where payNum BETWEEN 10 and 63;
	delete from payment where paycheck is null;
	delete from payment where MEMBERNUM is null;
	delete from point where point is null;
	
	create table delivery(
		deliveryNum NUMBER(10),
		memberNum NUMBER(10),
		addr  VARCHAR2(30),
		payNum NUMBER(10),
		deliveryDay Date,
	CONSTRAINT deliver_PK PRIMARY KEY (deliveryNum),
	CONSTRAINT memberNum_FK FOREIGN KEY (memberNum) REFERENCES member(memberNum),
	CONSTRAINT payNum_FK FOREIGN KEY (payNum) REFERENCES payment(payNum)
	);
	
SELECT TABLE_NAME, CONSTRAINT_NAME
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME IN('Address','member');

select 
	 (select seat from seat where seatNum = seatNum)
from payment
where storeId = (select storeId from seat where seatNum = '1') 
		AND status = '0';

				(select p.paycheck from payment where p.paycheck = '2')
		
SELECT s.seat,
		d.addr,
		m.menuName,
		o.orderCount
FROM payment p
INNER JOIN orderCpt o
	ON (p.payNum = o.payNum)
INNER JOIN seat s
	ON (p.seatNum = s.seatNum)
INNER JOIN menu m
	ON (o.menuNum = m.menuNum)
INNER JOIN delivery d
	ON (p.payNum = d.paynum)
WHERE s.storeId = 'test'
	AND p.status = '0'

		
SELECT  s.seat,
		d.addr,
		m.menuName,
		o.orderCount,
		p.paycheck
FROM payment p
INNER JOIN orderCpt o
	ON (p.payNum = o.payNum)
INNER JOIN seat s
	ON (p.seatNum = s.seatNum)
INNER JOIN menu m
	ON (o.menuNum = m.menuNum)
INNER JOIN delivery d
	ON (p.payNum = d.paynum)
WHERE s.storeId = 'test'
	AND NOT p.status = '2'
	
/* 주문현황 뿌리기 */		
select  m.storeId,
		p.paycheck, 
		p.payNum,
		o.orderCount, 
		m.menuName, 
		s.seat, 
		d.addr
from payment p, 
	 orderCpt o, 
	 menu m, 
	 seat s, 
	 delivery d
where 	p.payNum = o.payNum 
		AND o.menuNum = m.menuNum 
		AND p.seatNum = s.seatNum(+) 
		AND p.payNum = d.paynum(+)
	    AND s.storeId = 'test'
	    AND NOT p.status = '2'
	    order by paynum , menuName ;
	    
UPDATE PAYMENT SET STATUS='1' WHERE PAYNUM = #{payNum}

UPDATE PAYMENT SET STATUS='2' WHERE PAYNUM = #{payNum}


select sum(point*pointCheck) AS totalPoint 
from point
where storeId = 'test'
	and memberNum = 1;
	
alter table point add(pointCheck varchar2(2)); 
alter table payment add (status varchar2(5));

SELECT seatNum FROM SEAT WHERE SEAT = '7' AND storeId = 'test'

	select addr from delivery 
		where memberNum = (SELECT memberNum FROM member WHERE phone = '123')
			AND DeliveryDay = (SELECT MAX(DeliveryDay)FROM delivery WHERE ADDR IS NOT NULL)
		
			select sum(point*pointCheck) "point" from point where memberNum ='1'
			
			select accountNum from admin where storeId = 'test'
			
			select addr
 from delivery 
		 WHERE DeliveryDay = (SELECT MAX(DeliveryDay)FROM delivery WHERE ADDR IS NOT NULL)		
		
			And memberNum = (SELECT memberNum FROM member WHERE phone = '123')
			
			alter table admin drop column storemenu
	select deladdr from member where phone='01056049466'
	
	
		INSERT INTO PAYMENT 
		(PAYNUM, 
		PAYCHECK, 
		PAYDAY, 
		POINTUSE, 
		COUPONUSE, 
		SEATNUM, 
		MEMBERNUM, 
		TOTALPAY, 
		STATUS)
	VALUES(
		4, 
		 0, 
		 sysdate, 
		 NVL(0,0), 
		 NVL(0,0),
		 (SELECT seatNum FROM SEAT WHERE SEAT = '' AND storeId = 'heon' and usercheck='1'), 
		 (SELECT memberNum FROM member WHERE phone = '01021265370'), 
		 1200, 
		 '0')
		 commit;
	
	delete from payment    
	delete from delivery
	
	commit
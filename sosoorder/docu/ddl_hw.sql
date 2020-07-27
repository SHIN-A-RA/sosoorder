
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
	AND o.orderNum= 1;
	
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

alter table payment add(status varchar2(5));

(SELECT NVL(max(PAYNUM), 0)+1 FROM PAYMENT)

insert into PAYMENT ("PAYNUM", "PAYCHECK", "PAYDAY", "POINTUSE", "COUPONUSE", "SEATNUM", "MEMBERNUM", "TOTALPAY", "STATUS")
values(10, '0', '2020-06-21 00:00:00....', '200', '1000', 1, 1, 27000, '0')

/* 결제테이블 인서트 */
insert into PAYMENT 
values(
	(SELECT NVL(max(PAYNUM), 0)+1 FROM PAYMENT), '0', sysdate, '200', '1000', 
	(SELECT seatNum FROM SEAT WHERE SEAT = '6'), 1, 27000, '0');
	
	





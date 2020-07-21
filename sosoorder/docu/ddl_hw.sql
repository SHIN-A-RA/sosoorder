
/*쿠폰 적용 누르면 쿠폰할인금액 받아오기*/
select c.discount 
FROM COUPON C JOIN USERCOUPON U ON(C.SERIALNUM = U.SERIALNUM)
WHERE C.storeId = 'test' 
   AND U.memberNum = 1
   AND U.usecheck = 0;
   
/* orderCpt insert */
insert into ORDERCPT values(2, null, 2, 3, 1, null)

/* 주문메뉴 */
SELECT m.menuName, o.orderCount, m.menuPrice*o.orderCount AS price
FROM menu m JOIN orderCpt o ON (m.menuNum = o.menuNum)
WHERE m.storeId = 'test' 
	AND o.orderNum= 1;
	
alter table point add(pointCheck varchar2(2)); 

/* 총적립금 */
select point from point 
where storeId = 'test' 
	and memberNum = 1
	and pointCheck = 0;



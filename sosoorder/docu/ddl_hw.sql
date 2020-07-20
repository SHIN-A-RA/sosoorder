
/*쿠폰 적용 누르면 쿠폰할인금액 받아오기*/
select c.discount 
FROM COUPON C JOIN USERCOUPON U ON(C.SERIALNUM = U.SERIALNUM)
WHERE C.storeId = 'test' 
   AND U.memberNum = 1
   AND U.usecheck = 0;
   
/* orderCpt insert */
insert into ORDERCPT values(2, null, 2, 3, 1, null)
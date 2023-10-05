-- 고객별 평균 판매 가격을 출력
select c.name, s
from (select custid, avg(saleprice)s
        from orders
        group by custid) o, customer c
where c.custid = o.custid;

-- 고객번호가 3보다 작은 고객의 판매금액의 합계를 구하시오.
select SUM(saleprice) "total"
from Orders o
where exists (select *
                from Customer c
                where custid <= 3 and c.custid = o.custid);
                
select * from book;

-- 책이름에 과학이라는 단어가 포함된 결과행을 출력하시오.
select * from book
where bookname like "%과학%";

create view v_book
as select * from book
where bookname like '%과학%';

-- 주소에 서울이라는 단어가 포함된 뷰를 생성하시오.
select * from customer
where address like '%서울%';

create view vw_customer
as select * from customer
where address like '%서울%';

select * from vw_customer;

-- 주문테이블에서 고객이름, 도서이름을 바로 확인할 수 있는 뷰를 생성한 후,
-- 김연아 고객이 구입한 도서의  주문번호, 도서명, 주문액을 출력하시오.
create view vw_orders(orderid, name, bookid, custid, bookname, saleprice, orderdate)
as select o.orderid, c.name, o.custid,  o.bookid, b.bookname, o.saleprice, o.orderdate
   from orders o, customer c, book b
   where o.custid = c.custid and o.bookid = b.bookid;
    
select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where name = '김연아';

-- 기존의 뷰를 수정한다.
create or replace view vw_customer(custid, name, address)
as select custid, name, address
from customer
where address like '%영국%';

select * from customer;

select * from vw_customer;

-- 뷰 삭제 
drop view vw_customer;

-- 판매가격이 20000원 이상인 도서의 도서번호, 도서이름,고객이름, 출판사, 판매가격을 보여주는 highrders  뷰를 생성하시오.
create view highorders 
as select b.bookid,b.bookname,c.name,b.publisher,o.saleprice
from book b, orders o , customer c
where b.bookid = o.bookid and c.custid = o.custid and o.saleprice >= 20000;

-- 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 sql문을 작성하시오.
select bookname, name
from highorders;

-- highorders 뷰를 변경하고자 한다. 판매가격 속성을 삭제하는 명령을 수행하시오.
-- 삭제후 2번 sql문을 다시 수행하시오.
create or replace view highorders(bookid, bookname, name, publisher)
as select o.bookid, b.bookname, c.name, b.publisher
from orders o, customer c, book b
where saleprice > 5000 and o.custid = c.custid and o.bookid = b.bookid;

-- insertbook 프로시저 실행
exec insertbook(13, '스포츠과학', '마당과학서적' , 25000);

select * from book;

exec insertorupdate(14,'스포츠 즐거움', '마당과학서적', 30000);

exec insertorupdate(14,'스포츠 즐거움', '마당과학서적', 20000);

set serveroutput on;
declare
    averageVal number;
begin 
    averagePrice(averageVal);
    DBMS_OUTPUT.PUT_LINE('도서평균가격: ' ||round(averageVal, 2));
end;
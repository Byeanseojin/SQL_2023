-- 집합연산자: 합집합(UNION), 차집합(MINUS), 교집합(INTERSECT)
-- 차집합 연산자 사용
-- 도서를 주문하지 않은 고객의 이름을 쓰시오.
select name from customer;

select distinct name from customer;

select name from customer
where custid not in(select distinct custid from orders);

-- 차집합 연산자 사용한 경우
select name from customer
minus
select name from customer
where custid in(select distinct custid from orders);

-- 집합자 연산자 사용하지 않은 경우
select name from customer
where custid not in(select distinct custid from orders);

-- EXISTS: 서브쿼리의 결과가 존재하는 경우에 true
-- 주문이 있는 고객의 이름과 주소를 출력하시오.
-- in연산자 사용한 경우
select name, address from customer
where custid in (select distinct custid from orders);
-- 동등조인과 중복행 제거
select distinct name, address from customer c, orders o 
where c.custid = o.custid;
-- Exists 사용한 경우
select name, address from customer c
where exists(select * from orders o
                        where c.custid = o.custid);
                        
-- 5. 박지성이 구매한 도서의 출판사 수
select count(*) as 출판사의수 
from customer c,orders o
where c.custid=o.custid and c.name like'%박지성%'
group by c.name;
-- 6. 박지성이 구매한 도서의 이름, 가격 , 정가와 판매가격의 차이
select bookname, price, price-saleprice
from book b, orders o, customer c
where b.bookid = o.bookid
and o.custid = c.custid
and c.name = '박지성';
-- 7. 박지성이 구매하지 않은 도서의 이름
select bookname from book b, orders o, customer c
minus
select bookname from book b, orders o, customer c
where (c.custid=o.custid) and (b.bookid=o.bookid) and (c.name='박지성');



-- 8.주문하지 않은 고객의 이름(부속질의 사용)
select name
from customer
where custid not in (select custid from orders);
-- 9. 주문 금액의 총액과 주문의 평균 금액
select sum(saleprice), avg(saleprice)
from orders;
-- 10. 고객의 이름과 고객별 구매액
select c.name, sum(o.saleprice)
from customer c,orders o
where c.custid = o.custid
group by c.name;
-- 11. 고객의 이름과 고객이 구매한 도서 목록
select c.name, b.bookname
from book b, orders o, customer c
where b.bookid = o.bookid
and c.custid = o.custid;
-- 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
select *
from book, orders
where book.bookid = orders.bookid
and book.price-orders.saleprice = (
select max(book.price-orders.saleprice)
from book, orders
where book.bookid = orders.bookid
);
-- 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select customer.name
from customer, orders
where customer.custid = orders.custid
group by customer.name
having avg(orders.saleprice) > (
select avg(orders.saleprice)
from orders
);

-- DDL(Data Defination Language): 데이터 정의어
-- create table/alter table/drop table
-- 테이블 생성 연습1
create table newbook1(
    bookid number, 
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- 테이블 생성 연습2
-- primary key 설정 방법 1
create table newbook2(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key(bookid)
    );
    
-- primary key 설정 방법 2
create table newbook3(
    bookid number primary key ,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
    );

-- bookname 컬럼: null값 가질 수 없음
-- publisher 컬림: 동일한 값을 가질 수 없음
-- price 컬럼: 가격이 입력되어 있지 않으면 기본값을 10000으로하고 입력될 때는 1000초과로 함
-- bookname, publisher 컬럼을 복합키로 설정
create table newbook4(
    bookname varchar2(20) not null, 
    publisher varchar2(20) unique,
    price number default 10000 check(price > 1000), 
    primary key(bookname, publisher)
);
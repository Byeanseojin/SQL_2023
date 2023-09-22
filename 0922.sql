-- 절댓값 
select abs(-15) from dual;

-- 올림
select ceil(15.7) from dual;

-- 코사인 값
select cos(3.14159) from dual;

-- 내림
select floor(15.7) from dual;

-- 밑(base)이 10인 로그 값을 계산
select log(10,100) from dual;

-- 나머지
select mod(11,4) from dual;

-- 거듭제곱
select power(3,2) from dual;

-- 반올림
select round(15.7) from dual;

-- 숫자의 부호를 반환
select sign(-15) from dual;

-- 정수 부분만 남김
select trunc(15.7) from dual;

-- 주어진 ASCII 코드에 해당하는 문자를 반환
select chr(67) from dual;

-- 두 문자열을 연결
select concat('HAPPY', 'Birthday') from dual;

-- 문자열을 소문자로 변환
select lower('Birthday') from dual;

-- 문자열을 주어진 길이만큼 왼쪽에서부터 채움
select lpad('Page 1', 15, '*.') from dual;

-- 문자열 왼쪽의 특정 문자(여기서는 'a'와 'e')를 제거
select ltrim('Page 1','ae') from dual;

-- 문자열에서 특정 문자를 대체
select replace('JACK', 'J', 'BL') from dual;

-- 문자열을 주어진 길이만큼 오른쪽에서부터 채움
select rpad('Page 1', 15, '*.') from dual;

-- 문자열 오른쪽의 특정 문자(여기서는 'a'와 'e')를 제거
select rtrim('Page 1', 'ae') from dual;

-- 문자열에서 특정 위치와 길이의 부분 문자열을 추출
select substr('ABCDEFG',3,4) from dual;

-- 문자열의 왼쪽에서 '0' 문자를 제거
select trim(LEADING 0 FROM '00AA00') from dual;

-- 문자열을 대문자로 변환
select upper('Birthday') from dual;

-- 문자의 ASCII 코드를 반환
select ascii('A') from dual;

-- 문자열에서 특정 문자열의 위치를 찾음
select instr('CORPORATE FLOOR','OR',3,2) from dual;

-- 문자열의 길이를 반환
select length('Birthday') from dual;

-- 날짜를 더함
select add_months(TO_DATE('14/05/21', 'yy/mm/dd'),1) from dual;

-- 현재 월의 마지막 날짜를 반환
select last_day(sysdate) from dual;

-- 다음으로 지정된 요일(여기서는 'Thu' 즉, 목요일)로 이동
select next_day(sysdate, 'Thu') from dual;

-- 현재 날짜와 시간을 반올림한 값(시간, 분, 초 제외)을 반환
select round(sysdate) from dual;

-- 현재 시스템 날짜와 시간을 반환
select sysdate from dual;

-- 날짜를 문자열로 변환
select to_char(sysdate) from dual;

-- 숫자를 문자열로 변환
select to_char(123) from dual;

-- 문자열을 날짜로 변환
select to_date('12 05 2014', 'DD MM YYYY') from dual;

-- 문자열을 숫자로 변환
select to_number('12.3') from dual;

-- 조건에 따라 값0을 반환
select decode(1,1,'aa','bb') from dual;

-- 두 값을 비교하여 같으면 NULL을 반환하고 다르면 첫 번째 값을 반환
select nullif(123,345) from dual;

-- NULL 값을 다른 값으로 대체
select nvl(null, 123) from dual;

-- 고객의 이름과 전화번호를 출력하시오.(단, 전화번호가 없는 고객은 '연락처없음'으로 출력)
select name 이름, phone 전화번호 from customer;
select name 이름, nvl(phone, '연락처없음') 전화번호 from customer;

-- 고객목록에서 연번, 고객번호, 이름, 전화번호를 앞에 두명만 출력하시오.
select rownum 순번, custid, name, phone from Customer;
select rownum 순번, custid, name, phone from customer
where rownum<=2;

-- mybook 테이블 생성 
create table mybook (
    bookid number not null primary key,
    price number 
);
-- 데이터 행 삽입
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

--1 mybook 테이블의 모든 열 출력
select * from mybook;

--2 bookid와 price 열을 선택하고, price가 NULL인 경우 0으로 표시
select bookid, nvl(price,0) from mybook;

--3 price 열이 NULL인 행만 선택
select * from mybook where price is null;

--4 price 열이 빈 문자열인 행 선택 (단, 이 쿼리는 정확한 결과를 반환하지 않을 수 있습니다. NULL과 빈 문자열은 다른 개념입니다.)
select * from mybook where price = '';

--5 bookid와 price 열을 선택하고, price에 100을 더함
select bookid, price + 100 from mybook;

--6 bookid가 4 이상인 행들의 price의 합계, 평균 및 개수 계산
select sum(price), avg(price), count(*) from mybook where bookid >=4;

--7 전체 행 수와 price 열이 NULL이 아닌 행 수 계산
select count(*), count(price) from mybook;

--8 price 열의 합계와 평균 계산
select sum(price), avg(price) from mybook;

-- 1. "book" 테이블에서 모든 레코드를 선택
select * from book;

-- 2. "book" 테이블에서 처음 5개의 레코드를 선택
select * from book where rownum <= 5;

-- 3. "book" 테이블에서 처음 5개의 레코드를 선택하고 그 결과를 가격(price)을 기준으로 오름차순 정렬
select * from book where rownum <= 5 order by price;

-- 4. "book" 테이블에서 가격을 기준으로 정렬한 결과를 하위 쿼리로 만들고, 그 중 처음 5개의 레코드를 선택
select * from (select * from book order by price) b where rownum <= 5;

-- 5. "book" 테이블에서 처음 5개의 레코드를 선택한 뒤, 그 결과를 가격(price)을 기준으로 오름차순 정렬
select * from (select * from book where rownum <= 5) b order by price;

-- 6. "book" 테이블에서 처음 5개의 레코드를 선택하고 그 결과를 가격(price)을 기준으로 오름차순 정렬한 후, 그 정렬된 결과를 반환.
select * from (select * from book where rownum <= 5 order by price) b;

-- 평균판매금액 이하의 주문에 대해 주문번호와 금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액 from orders;
select avg(saleprice) from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice <= (select avg(saleprice) from orders);

-- 각 고객의 평균판매금액보다 큰 금액의 주문 내역에 대해서만 주문번호, 고객번호, 판매금액을 출력하시오.
select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders;

select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid = so.custid);

-- 서울에 거주하는 고객에게 판매한 도서의 총판매금액 출력하시오.
select sum(saleprice) 총판매금액 from orders;
-- 서울에 거주하는 사람의 고객번호
select custid from customer
where address like '%서울%';

select sum(saleprice) 총판매금액 from orders
where custid in(select custid from customer
where address like '%서울%');
-- 서울에 거주하지 않는 고객에게 판매한 도서의 총판매금액을 출력하시오.
select sum(saleprice) 총판매금액 from orders
where custid not in(select custid from customer
where address like '%서울%');

-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액 from orders;
select saleprice from orders where custid = 3;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice > all(select saleprice from orders where custid = 3);

-- 서울에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.(단, exist 연산자 사용)
select sum(saleprice) 총판매금액 from orders mo
where exists(
    select * from customer c
    where address like '%서울%' and mo.custid = c.custid
);

-- 고객별 판매금액의 합계를 출력하시오.(고객번호, 판매합계)
select custid 고객번호, sum(saleprice) 판매합계 from orders
group by custid;

-- 고객별 판매금액의 합계를 출력하시오.(고객명, 판매합계)
select (select name from customer c
         where c.custid = o.custid) 고객명, sum(saleprice) 판매합계 from orders o, customer c
group by o.custid;

-- 주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid = o.bookid);

-- 고객번호가 2이하인 고객번호와 이름을 출력하시오.
select custid 고객번호, name 이름 from customer
where custid <= 2;

-- 고객번호가 2이하인 고객의 판매금액을 출력하시오.(고객이름과 고객별 판매액 출력)
select name 고객이름, sum(saleprice) 판매총액
from(select custid , name from customer
        where custid <= 2) c, orders o 
where c.custid = o.custid
group by name;

-- 고객별 주문의 총 판매 금액 및 고객 주소 조회
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;

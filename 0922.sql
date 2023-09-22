-- ���� 
select abs(-15) from dual;

-- �ø�
select ceil(15.7) from dual;

-- �ڻ��� ��
select cos(3.14159) from dual;

-- ����
select floor(15.7) from dual;

-- ��(base)�� 10�� �α� ���� ���
select log(10,100) from dual;

-- ������
select mod(11,4) from dual;

-- �ŵ�����
select power(3,2) from dual;

-- �ݿø�
select round(15.7) from dual;

-- ������ ��ȣ�� ��ȯ
select sign(-15) from dual;

-- ���� �κи� ����
select trunc(15.7) from dual;

-- �־��� ASCII �ڵ忡 �ش��ϴ� ���ڸ� ��ȯ
select chr(67) from dual;

-- �� ���ڿ��� ����
select concat('HAPPY', 'Birthday') from dual;

-- ���ڿ��� �ҹ��ڷ� ��ȯ
select lower('Birthday') from dual;

-- ���ڿ��� �־��� ���̸�ŭ ���ʿ������� ä��
select lpad('Page 1', 15, '*.') from dual;

-- ���ڿ� ������ Ư�� ����(���⼭�� 'a'�� 'e')�� ����
select ltrim('Page 1','ae') from dual;

-- ���ڿ����� Ư�� ���ڸ� ��ü
select replace('JACK', 'J', 'BL') from dual;

-- ���ڿ��� �־��� ���̸�ŭ �����ʿ������� ä��
select rpad('Page 1', 15, '*.') from dual;

-- ���ڿ� �������� Ư�� ����(���⼭�� 'a'�� 'e')�� ����
select rtrim('Page 1', 'ae') from dual;

-- ���ڿ����� Ư�� ��ġ�� ������ �κ� ���ڿ��� ����
select substr('ABCDEFG',3,4) from dual;

-- ���ڿ��� ���ʿ��� '0' ���ڸ� ����
select trim(LEADING 0 FROM '00AA00') from dual;

-- ���ڿ��� �빮�ڷ� ��ȯ
select upper('Birthday') from dual;

-- ������ ASCII �ڵ带 ��ȯ
select ascii('A') from dual;

-- ���ڿ����� Ư�� ���ڿ��� ��ġ�� ã��
select instr('CORPORATE FLOOR','OR',3,2) from dual;

-- ���ڿ��� ���̸� ��ȯ
select length('Birthday') from dual;

-- ��¥�� ����
select add_months(TO_DATE('14/05/21', 'yy/mm/dd'),1) from dual;

-- ���� ���� ������ ��¥�� ��ȯ
select last_day(sysdate) from dual;

-- �������� ������ ����(���⼭�� 'Thu' ��, �����)�� �̵�
select next_day(sysdate, 'Thu') from dual;

-- ���� ��¥�� �ð��� �ݿø��� ��(�ð�, ��, �� ����)�� ��ȯ
select round(sysdate) from dual;

-- ���� �ý��� ��¥�� �ð��� ��ȯ
select sysdate from dual;

-- ��¥�� ���ڿ��� ��ȯ
select to_char(sysdate) from dual;

-- ���ڸ� ���ڿ��� ��ȯ
select to_char(123) from dual;

-- ���ڿ��� ��¥�� ��ȯ
select to_date('12 05 2014', 'DD MM YYYY') from dual;

-- ���ڿ��� ���ڷ� ��ȯ
select to_number('12.3') from dual;

-- ���ǿ� ���� ��0�� ��ȯ
select decode(1,1,'aa','bb') from dual;

-- �� ���� ���Ͽ� ������ NULL�� ��ȯ�ϰ� �ٸ��� ù ��° ���� ��ȯ
select nullif(123,345) from dual;

-- NULL ���� �ٸ� ������ ��ü
select nvl(null, 123) from dual;

-- ���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�.(��, ��ȭ��ȣ�� ���� ���� '����ó����'���� ���)
select name �̸�, phone ��ȭ��ȣ from customer;
select name �̸�, nvl(phone, '����ó����') ��ȭ��ȣ from customer;

-- ����Ͽ��� ����, ����ȣ, �̸�, ��ȭ��ȣ�� �տ� �θ� ����Ͻÿ�.
select rownum ����, custid, name, phone from Customer;
select rownum ����, custid, name, phone from customer
where rownum<=2;

-- mybook ���̺� ���� 
create table mybook (
    bookid number not null primary key,
    price number 
);
-- ������ �� ����
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

--1 mybook ���̺��� ��� �� ���
select * from mybook;

--2 bookid�� price ���� �����ϰ�, price�� NULL�� ��� 0���� ǥ��
select bookid, nvl(price,0) from mybook;

--3 price ���� NULL�� �ุ ����
select * from mybook where price is null;

--4 price ���� �� ���ڿ��� �� ���� (��, �� ������ ��Ȯ�� ����� ��ȯ���� ���� �� �ֽ��ϴ�. NULL�� �� ���ڿ��� �ٸ� �����Դϴ�.)
select * from mybook where price = '';

--5 bookid�� price ���� �����ϰ�, price�� 100�� ����
select bookid, price + 100 from mybook;

--6 bookid�� 4 �̻��� ����� price�� �հ�, ��� �� ���� ���
select sum(price), avg(price), count(*) from mybook where bookid >=4;

--7 ��ü �� ���� price ���� NULL�� �ƴ� �� �� ���
select count(*), count(price) from mybook;

--8 price ���� �հ�� ��� ���
select sum(price), avg(price) from mybook;

-- 1. "book" ���̺��� ��� ���ڵ带 ����
select * from book;

-- 2. "book" ���̺��� ó�� 5���� ���ڵ带 ����
select * from book where rownum <= 5;

-- 3. "book" ���̺��� ó�� 5���� ���ڵ带 �����ϰ� �� ����� ����(price)�� �������� �������� ����
select * from book where rownum <= 5 order by price;

-- 4. "book" ���̺��� ������ �������� ������ ����� ���� ������ �����, �� �� ó�� 5���� ���ڵ带 ����
select * from (select * from book order by price) b where rownum <= 5;

-- 5. "book" ���̺��� ó�� 5���� ���ڵ带 ������ ��, �� ����� ����(price)�� �������� �������� ����
select * from (select * from book where rownum <= 5) b order by price;

-- 6. "book" ���̺��� ó�� 5���� ���ڵ带 �����ϰ� �� ����� ����(price)�� �������� �������� ������ ��, �� ���ĵ� ����� ��ȯ.
select * from (select * from book where rownum <= 5 order by price) b;

-- ����Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;
select avg(saleprice) from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice <= (select avg(saleprice) from orders);

-- �� ���� ����Ǹűݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ��� �ֹ���ȣ, ����ȣ, �Ǹűݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid = so.custid);

-- ���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹűݾ� ����Ͻÿ�.
select sum(saleprice) ���Ǹűݾ� from orders;
-- ���￡ �����ϴ� ����� ����ȣ
select custid from customer
where address like '%����%';

select sum(saleprice) ���Ǹűݾ� from orders
where custid in(select custid from customer
where address like '%����%');
-- ���￡ �������� �ʴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�.
select sum(saleprice) ���Ǹűݾ� from orders
where custid not in(select custid from customer
where address like '%����%');

-- 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;
select saleprice from orders where custid = 3;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice > all(select saleprice from orders where custid = 3);

-- ���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.(��, exist ������ ���)
select sum(saleprice) ���Ǹűݾ� from orders mo
where exists(
    select * from customer c
    where address like '%����%' and mo.custid = c.custid
);

-- ���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����ȣ, �Ǹ��հ�)
select custid ����ȣ, sum(saleprice) �Ǹ��հ� from orders
group by custid;

-- ���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����, �Ǹ��հ�)
select (select name from customer c
         where c.custid = o.custid) ����, sum(saleprice) �Ǹ��հ� from orders o, customer c
group by o.custid;

-- �ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid = o.bookid);

-- ����ȣ�� 2������ ����ȣ�� �̸��� ����Ͻÿ�.
select custid ����ȣ, name �̸� from customer
where custid <= 2;

-- ����ȣ�� 2������ ���� �Ǹűݾ��� ����Ͻÿ�.(���̸��� ���� �Ǹž� ���)
select name ���̸�, sum(saleprice) �Ǹ��Ѿ�
from(select custid , name from customer
        where custid <= 2) c, orders o 
where c.custid = o.custid
group by name;

-- ���� �ֹ��� �� �Ǹ� �ݾ� �� �� �ּ� ��ȸ
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;

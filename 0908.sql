-- ���տ�����: ������(UNION), ������(MINUS), ������(INTERSECT)
-- ������ ������ ���
-- ������ �ֹ����� ���� ���� �̸��� ���ÿ�.
select name from customer;

select distinct name from customer;

select name from customer
where custid not in(select distinct custid from orders);

-- ������ ������ ����� ���
select name from customer
minus
select name from customer
where custid in(select distinct custid from orders);

-- ������ ������ ������� ���� ���
select name from customer
where custid not in(select distinct custid from orders);

-- EXISTS: ���������� ����� �����ϴ� ��쿡 true
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�.
-- in������ ����� ���
select name, address from customer
where custid in (select distinct custid from orders);
-- �������ΰ� �ߺ��� ����
select distinct name, address from customer c, orders o 
where c.custid = o.custid;
-- Exists ����� ���
select name, address from customer c
where exists(select * from orders o
                        where c.custid = o.custid);
                        
-- 5. �������� ������ ������ ���ǻ� ��
select count(*) as ���ǻ��Ǽ� 
from customer c,orders o
where c.custid=o.custid and c.name like'%������%'
group by c.name;
-- 6. �������� ������ ������ �̸�, ���� , ������ �ǸŰ����� ����
select bookname, price, price-saleprice
from book b, orders o, customer c
where b.bookid = o.bookid
and o.custid = c.custid
and c.name = '������';
-- 7. �������� �������� ���� ������ �̸�
select bookname from book b, orders o, customer c
minus
select bookname from book b, orders o, customer c
where (c.custid=o.custid) and (b.bookid=o.bookid) and (c.name='������');



-- 8.�ֹ����� ���� ���� �̸�(�μ����� ���)
select name
from customer
where custid not in (select custid from orders);
-- 9. �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice), avg(saleprice)
from orders;
-- 10. ���� �̸��� ���� ���ž�
select c.name, sum(o.saleprice)
from customer c,orders o
where c.custid = o.custid
group by c.name;
-- 11. ���� �̸��� ���� ������ ���� ���
select c.name, b.bookname
from book b, orders o, customer c
where b.bookid = o.bookid
and c.custid = o.custid;
-- ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
select *
from book, orders
where book.bookid = orders.bookid
and book.price-orders.saleprice = (
select max(book.price-orders.saleprice)
from book, orders
where book.bookid = orders.bookid
);
-- ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
select customer.name
from customer, orders
where customer.custid = orders.custid
group by customer.name
having avg(orders.saleprice) > (
select avg(orders.saleprice)
from orders
);

-- DDL(Data Defination Language): ������ ���Ǿ�
-- create table/alter table/drop table
-- ���̺� ���� ����1
create table newbook1(
    bookid number, 
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- ���̺� ���� ����2
-- primary key ���� ��� 1
create table newbook2(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key(bookid)
    );
    
-- primary key ���� ��� 2
create table newbook3(
    bookid number primary key ,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
    );

-- bookname �÷�: null�� ���� �� ����
-- publisher �ø�: ������ ���� ���� �� ����
-- price �÷�: ������ �ԷµǾ� ���� ������ �⺻���� 10000�����ϰ� �Էµ� ���� 1000�ʰ��� ��
-- bookname, publisher �÷��� ����Ű�� ����
create table newbook4(
    bookname varchar2(20) not null, 
    publisher varchar2(20) unique,
    price number default 10000 check(price > 1000), 
    primary key(bookname, publisher)
);
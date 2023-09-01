select * from book;
-- book���̺��� �����̶�� ���ڿ��� �����ϰ� ���������� 15000�� �̻��� ������ ���� �˻��Ͻÿ�.
select * from book
         where bookname like '%����%' and price >= 15000;
-- book���̺��� ���ǻ簡 �½����� �Ǵ� ��ũ�ν��� ������ �˻��Ͻÿ�.
select * from book
         where publisher='�½�����' or publisher='��ũ�ν�';
-- ���� ������ in �����ڸ� ����Ͽ� ������ ������.
select * from book
         where publisher in ('�½�����','��ũ�ν�');
-- book���̺��� ����������� �˻��Ͻÿ�.
select * from book
         order by bookname;
-- book���̺��� ������ȣ������ �˻��Ͻÿ�.
select * from book
         order by bookid;
-- book���̺��� ���ݼ����� �˻��� �ϰ� ���� �����̸� �̸������� �˻��Ͻÿ�.
select * from book
         order by price, bookname;
-- book���̺��� ������ ������������ �˻��ϰ� ���� �����̸� ���ǻ������ �˻��Ͻÿ�.
select * from book
         order by price desc, publisher asc;
         
select * from orders;
-- orders ���̺��� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.(��, �����Լ� ���(�հ�: sum))
select sum(saleprice) as ���Ǹűݾ� from orders;

-- orders ���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ� 
from orders
where custid=1;

-- orders���̺��� �Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ�,
    avg(saleprice) as �Ǹž����,
    min(saleprice) as ��������,
    max(saleprice) as �ִ밡��
from orders;
-- orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�.
select count(*) from orders;
-- orders ���̺��� ���������� 13000���̻��� ������ ������ ���Ͻÿ�.
select count(*) from orders where saleprice >= 13000;
-- orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ�.
select count(*) from orders where custid in(1,3);

-- orders ���̺��� ���� �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�.
-- �׷�ȭ(�κ���): group by
select count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ� from orders
group by custid
order by custid;
-- orders ���̺��� �ǸŰ����� 8000�� �̻��� ������ ������ ���� ���� ���� ������ �� ������ ���Ͻÿ�.
-- �� 2���̻� ������ ���� ����Ͻÿ�.
select custid, count(*) as �������� from orders
where saleprice>=8000
group by custid
having count(*) >=2
order by custid;

-- 01.������ȣ�� 1�� ������ �̸�
SELECT bookname FROM book WHERE bookid = 1;
-- 02. ������ 20000�� �̻��� ������ �̸�
SELECT bookname FROM book WHERE price >= 15000;
-- 03. �������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
SELECT sum(saleprice) as �ѱ��ž� FROM orders WHERE custid = 1;
-- 04. �������� ������ ������ �� (�������� ����ȣ�� 1������ ���� �ۼ�)
SELECT count (*)as �����Ǽ� FROM orders WHERE custid = 1;

-- 01. ���缭�� ������ �� ����
select count(*) as �Ѱ��� from orders ;
-- 02. ���缭�� ������ ����ϴ� ���ǻ��� �� ����
select count(distinct publisher) as ���ǻ����Ѱ��� from book ;
-- 03. ��� ���� �̸�, �ּ�
select name,address from customer;
-- 04. 2023�� 7�� 4��~ 7�� 12�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
select orderid from orders where orderdate between '23-07-04' and '23-07-12';
-- 05. 2023�� 7�� 4�� ~ 7�� 12�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ
select orderid from orders where orderdate not between '23-07-4' and '23-07-12';
-- 06. ���� '��'���� ���� �̸��� �ּ�
SELECT name, address FROM customer WHERE name like'%��__';
-- 07. ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
SELECT name, address FROM customer WHERE name like'%��_��';
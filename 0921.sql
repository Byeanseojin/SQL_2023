-- 1.�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
 
-- �������� ������ ������ ���ǻ��̸��� ����Ͻÿ�.
select publisher from customer cs, orders os, book bs
where cs.custid = os.custid and bs.bookid = os.bookid 
and name like '������';

select name 
from customer cs, orders os, book bs
where cs.custid = os.custid and bs.bookid = os.bookid 
and name not like '������'
and publisher in(
    select publisher from customer cs, orders os, book bs
    where cs.custid = os.custid and bs.bookid = os.bookid 
    and name like '������'
);

-- 2. �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
select cs.name
from customer cs
where cs.custid in (
    select os.custid
    from orders os, customer cs, book bs
    where os.bookid = bs.bookid
    group by os.custid
    having count(distinct bs.publisher) >= 2
);

select name
from customer cm
where(select count(distinct publisher) from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and name like cm.name)>=2;
--(����) ��ü ���� 30%�̻��� ������ ����
select bookname from book bm
where(select count(b.bookid) from book b, orders o 
      where b.bookid = o.bookid and b.bookid = bm.bookid)
      >= (select count(*) from customer) * 0.3;
      
-- 01: ���ο� ����('����������', '���ѹ̵��',10000��)�� ���缭���� �԰�Ǿ���. ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ��ÿ�
insert into Book (bookid, bookname, Publisher, Price)
values (11, '������ ����', '���ѹ̵��', 10000);

-- 02:'���̿�'���� ������ ������ �����ؾ� �Ѵ�.
delete book
where publisher = '���̿�';

-- 03: '�̻�̵��'���� ������ ������ �����Ͻÿ�. ������ �� �Ǹ� ������ ������ ���ÿ�.
delete from book
where publisher like'�س�';
-- ���Ἲ ��������(C##MADANG.SYS_C008318)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
-- ���� '�س�'���ǻ��� ���������� ������ �� ����.
-- 04: ���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲٽÿ�.
update publishers
set publisher = '�������ǻ�'
where publisher = '���ѹ̵��';

-- abs: ���밪���ϴ� �Լ�
select abs(-33), abs(33) from dual;

-- 5.657�� �Ҽ� ù°�ڸ����� �ݿø��� ���� ���Ͻ�dh.
select round(5.657, 1) from dual;

-- ���� ��� �ֹ��ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�.
select custid "����ȣ", round(sum(saleprice)/count(*), -2) "��� �ݾ�"
from orders
group by custid;

-- ������ '����'�� ���Ե� ������ '����'���� �����Ͽ�����������  ����Ͻÿ�.
-- ���� book ���̺��� ���������͸� �����ϸ� �ȵ˴ϴ�.
select bookid, replace(bookname, '����', '����') bookname, publisher,price 
from book;
select * from book;

-- ���ǻ簡 '�س�'�� �������� ���� ���� ����Ʈ ���� ����Ͻÿ�
select bookname "������", length(bookname) ���ڼ�, lengthb(bookname) ����Ʈ��
from book where publisher like '�س�';

-- �� �߿��� ���� ������ ���� ����� �� ������ ������ �ο� ���� ����Ͻÿ�.
select substr(name, 1, 1)"����", count(*) "�ο���" from customer
group by substr(name, 1,1);

-- ������ �ֹ�Ȯ������ �ֹ��Ϸκ��� 10�� ���̴�. �ֹ���ȣ, �ֹ���, �ֹ�Ȯ������ ����Ͻÿ�.
select orderid �ֹ���ȣ, orderdate �ֹ���, orderdate+10 �ֹ�Ȯ����
from orders;

-- 2023�� 8�� 28�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ����Ͻÿ�.
-- ��, �ֹ�����  "yyyy-mm-dd"�� ���� format���� ǥ���Ͻÿ�.
select orderid �ֹ���ȣ, to_char( orderdate, 'yyyy-mm-ddd') �ֹ���, custid ����ȣ, bookid ������ȣ
from orders
where orderdate = to_date('20230828','yyyymmdd');

-- 2023�� 8�� 28�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����, ������ ��� ����Ͻÿ�.
-- ��, �ֹ�����  "yyyy�� mm�� dd��"�� ���� format���� ǥ���Ͻÿ�.
select orderid �ֹ���ȣ,to_char( orderdate, 'yyyy-mm-dd') �ֹ���, name ����, bookname ������
from orders o ,book b, customer c
where o.bookid = b.bookid and c.custid = o.custid and  orderdate = to_date('20230828','yyyymmdd');
-- DB ������ ������ ��¥�� �ð� ������ ����Ͻÿ�.
-- ���� ��ȯ�� ��¥�� ������ ������(�⵵ 4�ڸ�/ ��2�ڸ�/ ��¥ 2�ڸ� �����ѿ���, ��:��:��) ��¥�� �ð� 2������ ��� ����Ͻÿ�.
select sysdate ������ȯ�Ȱ�, to_char (sysdate, 'yyy/mm/dd dy hh24:mi:ss' ) �������ĳ�¥�׽ð� from dual;


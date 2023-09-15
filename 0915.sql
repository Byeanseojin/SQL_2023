-- DDL(Data Defination Language):������ ���Ǿ�

-- ��������(newcustomer ���̺�)
-- custid, name, address, phone
create table newcustomer(
    custid number primary key,
    name varchar2(40),
    adress varchar2(40),
    phone varchar2(30)
);

-- �ֹ�����(newrders ���̺�)
-- orderid(�⺻Ű), custid(not null, customer custid �����ؼ� �ܷ�Ű, ������� ), 
-- bookid(not null newbook1 bookid �����ؼ� �ܷ�Ű, �������)
-- saleprice
-- orderdatd(date��)
create table neworders(
    orderid number,
    custid number not null,
    bookid number not null,
    saleprice number,
    orderdate date,
    primary key(orderid),
    foreign key(custid) references newcustomer(custid) on delete cascade,
    foreign key(bookid) references newbook3(bookid) on delete cascade
);

-- Alter��
-- �̹� ������ ���̺��� ������ ������ �� ���
-- add(�߰�), drop(����), modify(����)

-- ������ newbook1 ���̺��� �����ϰ� �� ���̺� �ۼ�
create table newbook1(
    bookid number,
    bookname varchar2(20),
    pulbisher varchar2(20), 
    price number 
);
-- isbn�÷��߰�
alter table newbook1
add isbn varchar2(13);
-- isbn�÷��� �ڷ��� ����
alter table newbook1
modify isbn number;

-- isbn �÷� ����
alter table newbook1 
drop column isbn;

-- bookname �÷��� vachar2(30) not null �������� ����
alter table newbook1
modify bookname varchar2(30) not null;

-- bookid �÷��� not null ��������
alter table newbook1
modify bookid number not null;
-- bookid �÷��� �⺻Ű �߰�
alter table newbook1
add primary key(bookid);

-- ���̺� ����
drop table newbook1;

-- DML(select, insert(�����ͻ���) , update(�����ͼ���), delete(�����ͻ���))
-- insert 1��: �Ӽ�(�÷�)����Ʈ ����

insert into book
values(11, '����','�س�', 12000);

-- insert 2��: �Ӽ�(�÷�)����Ʈ ����
insert into book(bookid, bookname, publisher, price)
values(12, '���ӿ���������', '����å', 8000);

-- insert 3��: �÷��� ������ ����
insert into book(bookid, price, publisher, bookname)
values(13, 28000, '���ڳ���', '���� ����');

-- insert 4��: Ư�� �÷��� ���� ����
insert into book(bookid, price, bookname)
values(14, 10000, '��ħ ����');

-- ���̺������� ���� �ٸ� ���̺��� �������� �����ϴ� ���
insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

-- update: ������ ����
-- ������ȣ�� 5���� ������ �ּҸ� ���ѹα� �λ� �����Ͻÿ�.
select * from customer;
update customer
set address = '���ѹα� �λ�'
where custid = 5;

-- �ڼ��� ������ �ּҸ� �迬�� ������ �ּҿ� �����ϰ� �����Ͻÿ�.
update customer
set address=(select address
            from customer
            where name='�迬��')
where name='�ڼ���';

-- �ڼ��� ������ ��ȭ��ȣ�� �迬�� ������ ��ȭ��ȣ�� �����ϰ� �����Ͻÿ�.
update customer
set phone=(select phone
            from customer
            where name='�迬��')
where name='�ڼ���';

-- ��� ������ �����Ͻÿ�.
delete from customer;

select * from orders;
select * from customer;

-- �ڼ��� ������ �����Ͻÿ�.
delete from customer
where name ='�ڼ���';

rollback;
commit;

-- 1.�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ������ �̸�
-- 2. �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ������ �̸�
-- 3. (����)��ü ������ 30% �̻��� ������ ����
set serveroutput on;
exec interest;

create table book_log(
    bookid_1 number,
    bookname_1 varchar2(40),
    publisher_1 varchar2(40),
    price_1 number
);

create or replace PROCEDURE INSERTBOOK (
    myBookId in number,
    myBookName in varchar2, 
    myPublisher in varchar2,
    myPrice in number)
AS 
BEGIN
  insert into book(bookid, bookname, publisher, price)
  values(myBookId, myBookName, myPublisher, myPrice);
END;

create or replace PROCEDURE INSERTORUPDATE(
    myBookId number,
    myBookName varchar2,
    myPublisher varchar2,
    myPrice int)
AS 
    myCount number;
BEGIN
  select count(*) into myCount from book
  where bookname like myBookName;
  
  if myCount!=0 then
    update book set price = myPrice
    where bookname like myBookName;
  else
    insert into book(bookid, bookname, publisher, price)
    values(myBookId, myBookName, myPublisher, myPrice);
  end if;
END INSERTORUPDATE;

create or replace PROCEDURE AVERAGEPRICE (
    averageVal out number)
AS 
BEGIN
  select avg(price) into averageVal from book
  where price is not null;
END AVERAGEPRICE;

create or replace procedure interest
as
    myInterest numeric;
    price numeric;
    cursor interestCursor is select saleprice from orders;
begin
    myInterest := 0.0;
    open interestCursor;
    loop
        fetch interestCursor into price;
        exit when interestCursor%NOTFOUND;
        if price >= 30000 then
            myInterest := myInterest + price*0.1;
        else
            myInterest := myInterest + price*0.05;
        end if;
    end loop;
    close interestCursor;
    DBMS_OUTPUT.PUT_LINE('전체 이익금액 = ' || round(myInterest, 3));
end;

create or replace trigger afterinsertbook
after insert on book for each row
declare 
    average number;
begin
    insert into book_log
    values(:new.bookid, : new.bookname, :new.publisher, :new.price);
    dbms_output.put_line('삽입 행을 book_log 테이블에 백업했습니다.');
end;

insert into book values(15, '과학 좋아요', '과학미디어', 25000);
select * from book where bookid = 15;
select * from book_log where bookid_1=15;

-- 사용자 정희 함수 만들기
create or replace function fnc_interest(price number)
                                        return int
is
    myInterest number;
begin
    if price >= 30000 then
        myInterest := price * 0.1;
    else
        myInterest := price * 0.05;
    end if;
    return myInterest;
end;

-- 실행할 때 블럭설정하고 실행해 주세요.
select custid, orderid, saleprice, fnc_interest(saleprice) 이익금 from orders;

-- InsertBook()프로시저를 수정하여 고객을 새로 등록하는 InsertCustomer()프로시저를 작성하시오.

create or replace PROCEDURE INSERTCUSTOMER (
    myCustId in number,
    myName in varchar2,
    myAddress in varchar2,
    myPhone in varchar2)
AS 
BEGIN
  insert into customer(custid, name, address, phone)
  values(myCustId, myName, myAddress, myPhone);
END INSERTCUSTOMER;

set serveroutput on;
exec insertcustomer (7,'서지니','서울특별시 강동구','010-0000-4000');

select * from customer;
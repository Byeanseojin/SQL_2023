-- 도서정보 Book 테이블
create table Book(
    bookid NUMBER(2) primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- 고객정보 Customer 테이블
create table Customer (
    custid NUMBER(2) primary key,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);
-- 수입도서정보 Imported_Book 테이블
create table Imported_Book(
    bookid NUMBER(2),
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- 주문정보 Orders 테이블 
create table Orders (
    orderid NUMBER(2) primary key,
    custid NUMBER(2)REFERENCES Customer(custid),
    bookid NUMBER(2)REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

--Book 테이블에 10권의 도서 정보를 추가하세요
insert into Book values(1, '축구의 역사', '굿스포츠', 7000);
insert into Book values(2, '해리포터 죽음의 성물', '좋은책', 12000);
insert into Book values(3, '나무', '해냄', 15000);
insert into Book values(4, '세이노의 가르침', '데이원', 16000);
insert into Book values(5, '이토록 공부가 재밌어지는 순간', '다산북스', 13000);
insert into Book values(6, '도둑맞은 집중력', '메크로스', 12000);
insert into Book values(7, '문과 남자의 과학 공부', '돌베개', 15000);
insert into Book values(8, '슈퍼노멀', '웅진지식하우스', 12000);
insert into Book values(9, '역행자 확장판', '웅진지식하우스', 16000);
insert into Book values(10, '최소한의 한국사', '프런트페이지', 18000);

-- Customer 테이블에 고객정보 5명 추가
insert into customer values(1, '박지성', '영국 맨체스터', '000-5000-001');
insert into customer values( 2, '김연아', '서울 동작구 흑석동', '02-333-5555');
insert into customer values(3, '장미란', '서울 용산구 보광동', '02-555-7777');
insert into customer values(4, '추신수', '인천광역시 연수구', '032-233-5656');
insert into customer values(5, '박세리', '대전광역시 유성구', '042-322-123');



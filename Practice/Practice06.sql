DROP TABLE author;
DROP TABLE BOOK;

CREATE TABLE author(
    author_id number(5),
    author_name VARCHAR2(100),
    author_desc VARCHAR2(100)
);

ALTER TABLE author MODIFY(author_id number(10) PRIMARY KEY);

CREATE SEQUENCE seq_author_id
    INCREMENT BY 1
    START WITH 1
    NOCACHE;

INSERT INTO author VALUES(seq_author_id.NEXTVAL, '이문열', '경북 영양');
INSERT INTO author VALUES(seq_author_id.NEXTVAL, '박경리', '경상남도 통영');
INSERT INTO author VALUES(seq_author_id.NEXTVAL, '유시민', '17대 국회의원');
INSERT INTO author VALUES(seq_author_id.NEXTVAL, '기안84', '기안동에서 산 84년생');
INSERT INTO author VALUES(seq_author_id.NEXTVAL, '강풀', '온라인 만화가 1세대');
INSERT INTO author VALUES(seq_author_id.NEXTVAL, '김영하', '알쓸신잡');



SELECT seq_author_id.CURRVAL FROM dual;

SELECT*
FROM author;

CREATE TABLE book (
    book_id number(10),
    title VARCHAR2(100) NOT NULL,
    pubs VARCHAR2(100),
    pub_date DATE,
    author_id number(10),
    PRIMARY KEY(book_id),
    CONSTRAINT book_fk FOREIGN KEY(author_id)
    REFERENCES author (author_id)
);

CREATE SEQUENCE seq_book_id
    INCREMENT BY 1
    START WITH 1
    NOCACHE;
    
INSERT INTO book VALUES(seq_book_id.NEXTVAL, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
INSERT INTO book VALUES(seq_book_id.NEXTVAL, '삼국지', '민음사', '2002-03-01', 1);
INSERT INTO book VALUES(seq_book_id.NEXTVAL, '토지', '마로니에북스', '2012-08-15', 2);
INSERT INTO book VALUES(seq_book_id.NEXTVAL, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);
INSERT INTO book VALUES(seq_book_id.NEXTVAL, '패션왕', '중앙북스(books)', '2012-02-22', 4);
INSERT INTO book VALUES(seq_book_id.NEXTVAL, '순정만화', '재미주의', '2011-08-03', 5);
INSERT INTO book VALUES(seq_book_id.NEXTVAL, '오직두사람', '문학동네', '2017-05-04', 6);
INSERT INTO book VALUES(seq_book_id.NEXTVAL, '26년', '재미주의', '2012-02-24', 5);    
 
    
SELECT*
FROM book;

COMMIT;

SELECT bo.book_id,
       bo.title,
       bo.pubs,
       to_char(pub_date,'YYYY-MM-DD') pub_date,
       au.author_id,
       au.author_name,
       au.author_desc
FROM author au, book bo
WHERE au.author_id = bo.author_id;

UPDATE author
SET author_desc = '서울특별시'
WHERE author_id = 5;

DELETE FROM author
WHERE author_id = 4; --ORA-02292: integrity constraint (WEBDB.BOOK_FK) violated - child record found

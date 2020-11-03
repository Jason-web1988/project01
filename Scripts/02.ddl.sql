-- MEMBER TABLE 생성
CREATE TABLE member(
	name varchar2(10),
	userid varchar2(10),
	pwd varchar2(10),
	email varchar2(20),
	phone char(13),
	admin number(1) DEFAULT 0,
	joinDate DATE DEFAULT sysdate,
	PRIMARY KEY (userid)
);


SELECT *
  FROM USER_TABLES
 WHERE TABLE_NAME = 'MEMBER';
 
-- 접속한 계정의 테이블별 컬럼 조회
SELECT *
  FROM USER_TAB_COLUMNS 
 WHERE table_name IN ('MEMBER');
 
-- 접속한 계정의 테이블별 제약조건 검색
SELECT *
  FROM USER_CONSTRAINTS 
 WHERE table_name IN ('MEMBER');

SELECT * FROM MEMBER;













--title 
CREATE TABLE title(
	TITLE_NO NUMBER PRIMARY KEY,
	TITLE_NAME VARCHAR2(40)	
);

--department

DROP TABLE DEPARTMENT;
CREATE TABLE department(
	DEPT_NO NUMBER PRIMARY KEY,
	DEPT_NAME VARCHAR2(40),
	FLOOR NUMBER
);

DROP TABLE EMPLOYEE;
-- EMPLOYEE 테이블 생성
CREATE TABLE EMPLOYEE (
    EMP_NO   NUMBER,
    EMP_NAME VARCHAR2(20) NOT NULL,
    TNO      NUMBER,
    MANAGER  NUMBER,
    SALARY   NUMBER,
    DNO      NUMBER,
    EMAIL    varchar2(60) NOT NULL,
    PASSWD   varchar2(60) NOT NULL,
    REGDATE  DATE DEFAULT SYSDATE,
    TEL      char(13),
    pic_url  varchar2(100),
    CONSTRAINT EMPLOYEE_EMPNO_PK   PRIMARY KEY (EMP_NO),
    CONSTRAINT EMPLOYEE_TNO_FK     FOREIGN KEY (TNO)     REFERENCES TITLE(TITLE_NO) ON DELETE SET NULL, 
    CONSTRAINT EMPLOYEE_MANAGER_FK FOREIGN KEY (MANAGER) REFERENCES EMPLOYEE(EMP_NO),
    CONSTRAINT EMPLOYEE_SALARY_CK  CHECK (SALARY < 6000000),
    CONSTRAINT EMPLOYEE_DNO_FK     FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DEPT_NO) ON DELETE CASCADE
);


--------------------------------------------------------------
-----------------------게시판 테이블 생성---------------------------
--------------------------------------------------------------
CREATE TABLE BOARD(
	NUM			NUMBER(5) PRIMARY KEY, 
	PASS		VARCHAR2(30),
	NAME		VARCHAR2(30),
	EMAIL		VARCHAR2(30),
	TITLE		VARCHAR2(50),
	CONTENT		VARCHAR2(1000),
	READCOUNT	NUMBER(4) DEFAULT 0,
	WRITEDATE	DATE      DEFAULT SYSDATE
);      
      
CREATE SEQUENCE BOARD_SEQ
	START WITH 1
	INCREMENT BY 1;

-- 트리거를 이용하여 자동으로 번호가 입력되도록 

CREATE OR REPLACE TRIGGER TRI_BOARD_NUM_AUTOSEQ
BEFORE INSERT ON BOARD
FOR EACH ROW 
BEGIN 
	IF Inserting AND :NEW.NUM IS NULL THEN 
		SELECT BOARD_SEQ.NEXTVAL INTO :NEW.NUM FROM DUAL;
	END IF;
END;      
 









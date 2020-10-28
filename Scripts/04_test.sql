SELECT NAME, USERID, PWD, EMAIL, PHONE, ADMIN, JOINDATE
	FROM MEMBER;

SELECT NAME, USERID, PWD, EMAIL, PHONE, ADMIN
	FROM MEMBER
	WHERE USERID = 'somi';

INSERT INTO MEMBER(NAME, USERID, PWD, EMAIL, PHONE, ADMIN)
VALUES('박규영', 'parkgy', '1234', 'pgygmail.com', '010-1111-2222', 0);

INSERT INTO MEMBER VALUES('박규영', 'parkgy', '1234', 'pgygmail.com', '010-1111-2222', 0);
	
SELECT NAME, USERID, PWD, EMAIL, PHONE, ADMIN, JOINDATE 
	FROM MEMBER
	WHERE USERID = 'parkgy'

UPDATE MEMBER 
	SET NAME = '문채원', PWD='5678', EMAIL='mcw@gmail.com', 
		PHONE='010-3333-5555', ADMIN='1', JOINDATE='2020-08-20'
	WHERE userid='parkgy';
	
DELETE 
	FROM MEMBER 
	WHERE USERID ='parkgy'
	--usercheck
	SELECT PWD FROM MEMBER WHERE USERID = 'somi';
	
-- login
SELECT NAME, USERID, EMAIL, PHONE, ADMIN, JOINDATE
	FROM MEMBER
	WHERE USERID = 'somi' AND pwd = '1234';
	
--


SELECT USER FROM DUAL;

SELECT * FROM USER_TABLES;


SELECT TITLE_NO, TITLE_NAME FROM TITLE;

SELECT max(TITLE_NO)+1 FROM TITLE;

SELECT * FROM DEPARTMENT;

UPDATE DEPARTMENT 
	SET DEPT_NAME = '인턴' ,
			FLOOR = 3 
	WHERE DEPT_NO = 6 ;
	
CREATE OR REPLACE VIEW VW_EMPLOYEE_JOIN AS 
SELECT e.EMP_NO, e.EMP_NAME, e.TNO, e.MANAGER , e.SALARY, e.DNO, e.REGDATE, e.EMAIL , e.TEL , e.PIC_URL, 
       t.TITLE_NAME, d.DEPT_NAME, m.EMP_NAME MANAGER_NAME
  FROM EMPLOYEE e JOIN TITLE t ON e.TNO = t.TITLE_NO 
       LEFT JOIN EMPLOYEE m ON e.MANAGER = m.EMP_NO 
       JOIN DEPARTMENT d ON e.DNO = d.DEPT_NO; 
 		
 SELECT EMP_NO, EMP_NAME, TNO, MANAGEr, SALARY , DNO , REGDATE,
 	EMAIL, TEL, PIC_URL, TITLE_NAME, DEPT_NAME, MANAGER_NAME
 	FROM VW_EMPLOYEE_JOIN;
 	
 SELECT * FROM EMPLOYEE;
 SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD, TEL, PIC_URL FROM EMPLOYEE;
 UPDATE EMPLOYEE SET TEL = '010-5555-5666' WHERE EMP_NO = 7;
 
 SELECT EMP_NO, EMP_NAME, TNO, MANAGEr, SALARY , DNO , REGDATE,
 	EMAIL, TEL, PIC_URL, TITLE_NAME, DEPT_NAME, MANAGER_NAME
 	FROM VW_EMPLOYEE_JOIN WHERE TITLE_NAME = '부장' AND DEPT_NAME = '개발';
  SELECT EMP_NO, EMP_NAME, TNO, MANAGEr, SALARY , DNO , REGDATE,
 	EMAIL, TEL, PIC_URL, TITLE_NAME, DEPT_NAME, MANAGER_NAME
 	FROM VW_EMPLOYEE_JOIN WHERE TITLE_NAME = ? AND DEPT_NAME = ?;

 
 
 DELETE FROM TITLE WHERE TITLE_NO = 6;
 SELECT * FROM TITLE;
 SELECT * FROM DEPARTMENT d ;
 SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD, REGDATE, TEL, PIC_URL FROM EMPLOYEE;
 SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, REGDATE, TEL, PIC_URL, PASSWD
 FROM EMPLOYEE
 WHERE EMP_NO = 1003;
 
SELECT DEPT_NO,	DEPT_NAME, FLOOR FROM DEPARTMENT;
SELECT EMP_NO,EMP_NAME,TNO,MANAGER,SALARY,DNO,EMAIL,PASSWD,REGDATE,TEL,PIC_URL FROM EMPLOYEE;
SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, REGDATE, TEL, PIC_URL, PASSWD
FROM EMPLOYEE WHERE EMP_NO = 3011;
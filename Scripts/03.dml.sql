INSERT ALL
	INTO MEMBER VALUES ('이소미', 'somi', '1234', 'gmd@naver.com', '010-2362-5157', 0, sysdate)
	INTO MEMBER VALUES ('하상오', 'sang12', '1234', 'ha12@naver.com', '010-5629-8888', 1, sysdate)
	INTO MEMBER VALUES ('김윤승', 'light', '1234', 'youn104@naver.com', '010-9999-8282', 0, sysdate)
	SELECT 1 FROM DUAL;
	
SELECT * FROM MEMBER;

INSERT ALL
	INTO TITLE VALUES (1, '사장')
	INTO TITLE VALUES (2, '부장')
	INTO TITLE VALUES (3, '과장')
	INTO TITLE VALUES (4, '대리')
	INTO TITLE VALUES (5, '사원')
	SELECT 1 FROM DUAL;
	
SELECT * FROM TITLE;


INSERT ALL
	 INTO DEPARTMENT VALUES(1, '영업', 1)
	 INTO DEPARTMENT VALUES(2, '기획', 2)
	 INTO DEPARTMENT VALUES(3, '개발', 3)
	 INTO DEPARTMENT VALUES(4, '총무', 7)
SELECT 1 FROM DUAL;

SELECT DEPT_NO, DEPT_NAME, FLOOR FROM DEPARTMENT;


INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(4377, '이성래', 1, NULL, 5000000, 2, 'test@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3426, '박영권', 3, 4377, 3000000, 1, 'test1@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3011, '이수민', 2, 4377, 4000000, 3, 'test2@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3427, '최종철', 5, 3011, 1500000, 3, 'test3@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(1003, '조민희', 3, 4377, 3000000, 2, 'test4@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(2106, '김창섭', 4, 1003, 2500000, 2, 'test5@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(1365, '김상원', 5, 3426, 1500000, 1, 'test6@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(1004, '최은주', 2, 3426, 1500000, 4, 'test6@test.co.kr', '1234');

INSERT INTO EMPLOYEE(TEL) VALUES('010-1234-5678');

SELECT * FROM EMPLOYEE;
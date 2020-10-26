-- 계정 추가 및 권한 부여

-- 접속자 확인
SELECT USER FROM DUAL;

-- 계정 생성
DROP USER project01 CASCADE;
CREATE USER project01 IDENTIFIED BY rootroot;

-- 권한 추가
GRANT CONNECT, RESOURCE, CREATE SYNONYM, CREATE VIEW 
   TO project01;
   
-- 계정 확인
SELECT *
  FROM DBA_USERS
 WHERE USERNAME = 'project01';
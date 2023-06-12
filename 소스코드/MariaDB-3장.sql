# 1. 함수
SELECT 1+1 FROM DUAL;

SELECT 1+1;

# 2. 문자 함수
SELECT LOWER('MariaDB'); #mariadb
SELECT UPPER('MariaDB'); #MARIADB
SELECT LENGTH('MariaDB'); #7
SELECT LENGTH('마리아디비'); #15
SELECT LENGTH('Maria디비'); #11
SELECT LENGTHB('마리아디비'); #15
SELECT CHAR_LENGTH('마리아디비'); #5
SELECT CHAR_LENGTH('Maria디비'); #7
SELECT SUBSTRING('HelloMariaDB', 6, 5); #Maria
SELECT SUBSTR('안녕마리아디비', 3, 3); #마리아
SELECT INSTR('MariaDB', 'db'); #6
SELECT INSTR('안녕마리아디비', '마리아'); #3
SELECT LOCATE('db', 'MariaDB'); #6
SELECT LOCATE('a', 'MariaDB', 3); #5
SELECT CONCAT('Hello', 'Maria', 'DB'); #HelloMariaDB
SELECT CONCAT_WS('~~', 'Hello', 'World'); #Hello~~World
SELECT LPAD(17600, 10, '*'); #*****17600
SELECT RPAD(17600, 10, '*'); #17600*****
SELECT LPAD('MariaDB', 10, '*'); #***MariaDB
SELECT RPAD('MariaDB', 10, '*'); #MariaDB***
SELECT RPAD('마리아디비', 10, '*'); #마리아디비*****
SELECT LTRIM('  MariaDB'); #MariaDB
SELECT RTRIM('MariaDB   '); #MariaDB
SELECT TRIM('   MariaDB   '); #MariaDB
SELECT TRIM('Hello' FROM 'HelloMariaDB'); #MariaDB
SELECT TRIM('DB' FROM 'HelloMariaDB'); #HelloMariaDB
SELECT TRIM(LEADING 'Hello' FROM 'HelloMariaDB'); #MariaDB
SELECT REPLACE('MySQLDB', 'MySQL', 'Maria'); #MariaDB
SELECT REVERSE('MariaDB'); #BDairaM


SELECT last_name, LOWER(last_name), UPPER(last_name)
FROM   employees;

SELECT first_name, LENGTH(first_name), INSTR(first_name, 'a')
FROM   employees;

SELECT first_name, SUBSTR(first_name, 1, 3), CONCAT_WS(' ', first_name, last_name)
FROM   employees;

SELECT 
    RPAD(first_name, 10, '-') AS name, 
    LPAD(salary, 10, '*') AS sal 
FROM employees;


SELECT 
  RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') AS name,
  LPAD(salary, 10, '*') AS salary
FROM 
  employees
WHERE
  LOWER(job_id) = 'it_prog';
  

# 3. 정규표현식 함수
DROP TABLE messages;
CREATE TABLE messages (
	sender 	VARCHAR(50), 
	receiver	VARCHAR(50), 
	content 	VARCHAR(2000)
) DEFAULT CHARSET=utf8;

INSERT INTO messages 
VALUES('홍길동', '홍길서', '전화주세요. 010-1234-5678');

INSERT INTO messages 
VALUES('홍길남', '홍길북', 'hello sender@hello.com');

INSERT INTO messages 
VALUES('허진경', '홍길동', 'hjk@abc.com으로 메일주세요.');

INSERT INTO messages 
VALUES('홍길동', '이순신', '반갑습니다.');

INSERT INTO messages 
VALUES('정준수', '허진경', '010 2345 6789 hello@abc.com');

INSERT INTO messages 
VALUES('Eric', 'James', 'Call Me. 010.3456.7890');

COMMIT; 

SELECT * FROM messages;

SELECT * FROM messages
WHERE content REGEXP '[0-9]{3}-[0-9]{4}-[0-9]{4}';

SELECT * FROM messages
WHERE content REGEXP '[0-9]{3}-\\d{4}-[[:digit:]]{4}';

SELECT * FROM messages
WHERE content REGEXP '[0-9]{3}.[0-9]{4}\\.[0-9]{4}';


SELECT * FROM messages
WHERE content REGEXP '[0-9]{3}\\.[0-9]{4}\\.[0-9]{4}';


SELECT * FROM messages
WHERE content REGEXP '[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+';

SELECT * FROM messages
WHERE content REGEXP '\\S+@\\S+\\.\\S+';


SELECT * FROM messages
WHERE content REGEXP '[가-힣]+';


SELECT content, 
       REGEXP_INSTR(content, '\\S+@\\S+\\.\\S+') AS email,
       REGEXP_INSTR(content, '\\d{3}.\\d{4}.\\d{4}') AS phone,
       REGEXP_INSTR(content, '\\.') AS period,
       REGEXP_INSTR(content, '[가-힣]+') AS kor       
FROM messages;


SELECT content, 
       REGEXP_SUBSTR(content, '[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+') AS email,
       REGEXP_SUBSTR(content, '\\d{3}.\\d{4}.\\d{4}') AS phone,
       REGEXP_SUBSTR(content, '[가-힣 ]+') AS kor
FROM messages;


SELECT content, 
       REGEXP_REPLACE(content, '\\d{3}.\\d{4}.\\d{4}', '*') AS phone
FROM messages;


SELECT first_name, 
  REGEXP_REPLACE(phone_number, '[0-9]{4}$', '****') AS phone,
  REGEXP_SUBSTR(phone_number, '[0-9]{4}$') AS phone2
FROM   employees
WHERE  phone_number REGEXP '[0-9]{3}\\.[0-9]{3}\\.[0-9]{4}';


# 4. 숫자 함수
SELECT 1+2, 2-1, 2*3, 5/2, 5%2, 5/0, 5%0;
SELECT 5 DIV 2, 5 DIV 0,  MOD(5,2), 5 MOD 2, MOD(5,0);
SELECT ROUND(45.923,2), ROUND(45.923), ROUND(45.923,-1);
SELECT TRUNCATE(45.923,2), TRUNCATE(45.923,0), TRUNCATE(45.923,-1);
SELECT CEIL(12.34), CEIL(-12.34);
SELECT FLOOR(12.34), FLOOR(-12.34);
SELECT ABS(12.34), ABS(-12.34), SIGN(12.34), SIGN(-12.34);
SELECT POW(2,3), POWER(2,3), POW(3,2);
SELECT SQRT(9), SQRT(2);
SELECT PI(), PI()+0.000000000000000;
SELECT SIN(30*PI()/180), COS(60*PI()/180), TAN(45*PI()/180);
SELECT EXP(1), EXP(0), EXP(-1), EXP(10);
SELECT LN(EXP(1)), LOG(10,2), LOG10(2), LOG2(2);

# 5. 날짜 함수
SELECT '2023-05-30' + 1; #2024
SELECT '08:10:15' + 1; #9
SELECT '2023-05-30' - '2021-12-15'; #2, 연도 차이
SELECT '08:10:15' - '06:40:00'; #2, 시간 차이
SELECT '2023-05-30' + INTERVAL 1 MONTH; #2023-06-30
SELECT '2023-05-30' + INTERVAL 1 DAY; #2023-05-31
SELECT '2023-05-31 23:59:59' + INTERVAL 1 SECOND; #2023-06-01 00:00:00
SELECT '2023-05-30 10:00:00' + INTERVAL '1:2:30' DAY_MINUTE; #2023-05-31 12:30:00
SELECT ADD_MONTHS('2023-05-30', 2); #2023-07-30
SELECT ADDDATE('2023-05-30', 2); #2023-06-01
SELECT ADDDATE('2023-05-30', INTERVAL 2 DAY); #2023-06-01
SELECT DATE_ADD('2023-05-30', INTERVAL 2 DAY); #2023-06-01
SELECT SUBDATE('2023-05-30', 2); #2023-05-28
SELECT SUBDATE('2023-05-30', INTERVAL 2 DAY); #2023-05-28
SELECT DATE_SUB('2023-05-30', INTERVAL 2 DAY); #2023-05-28
SELECT ADDTIME('10:25:30', 2); #10:25:32
SELECT ADDTIME('10:25:30', '01:10:15'); #11:35:45
SELECT SUBTIME('10:25:30', 2); #10:25:28
SELECT SUBTIME('10:25:30', '01:10:15'); #09:15:15
SELECT DATEDIFF('2023-05-30', '2023-04-15'); #45
SELECT TIMEDIFF('10:15:30', '14:05:15'); #-03:49:45
SELECT TIMESTAMPDIFF(YEAR, '2002-05-01','2023-01-01'); #20
SELECT CONCAT('Today is ', CURDATE()), CURRENT_DATE, CURRENT_DATE()+0; #현재 날짜를 반환
SELECT CONCAT('It''s ', CURTIME()), CURRENT_TIME, CURRENT_TIME(6); #현재 시간을 반환
SELECT NOW(), LOCALTIME(), CURRENT_TIMESTAMP(), LOCALTIMESTAMP(); #현재 날짜와 시간을 반환
SELECT CURRENT_TIMESTAMP, LOCALTIME, LOCALTIMESTAMP; #현재 날짜와 시간을 반환
SELECT NOW(6), LOCALTIME(6), CURRENT_TIMESTAMP(6), LOCALTIMESTAMP(6); #현재 날짜와 시간을 반환
SELECT UNIX_TIMESTAMP(), UNIX_TIMESTAMP('2023-05-29 13:23:56');
SELECT FROM_UNIXTIME(1685334236), FROM_UNIXTIME(1685334236, '%Y-%m-%d %h:%i:%s');
SELECT FROM_UNIXTIME(1685334236), FROM_UNIXTIME(1685334236, '%y-%m-%d %h:%i:%s');
SELECT DATE(NOW()), YEAR(NOW()), MONTH(NOW()), DAY(NOW());
SELECT TIME(NOW(6)), HOUR(NOW()), MINUTE(NOW()), SECOND(NOW()), MICROSECOND(NOW(6));

CREATE TABLE example(
  col_microsec DATETIME(6),
  col_millisec TIME(3)
);

SELECT NOW(6), ROUND(NOW(6), 2), ROUND(NOW(6));
SELECT NOW(6), TRUNCATE(NOW(6), 2), TRUNCATE(NOW(6), 0);



SELECT 15+'15'; #30
SELECT CONCAT(15,'15'); #1515
SELECT '9746718491924563213123' = 9746718491924563213124; #1
SELECT '   5' = 5; #1
SELECT '   5' = 5;
SELECT '   5  ' = 5;
SHOW WARNINGS;

SELECT '2.2' + 3;
SELECT "2.2" + 3;
SELECT TIME'10:20:30' + 31; #102061
SELECT TIME'10:20:30' + INTERVAL 31 SECOND; #10:21:01
SELECT "2.2" / 3; #0.7333333333333334

DROP TABLE t;
CREATE TABLE t (a INT, b VARCHAR(10));

INSERT INTO t VALUES 
  (1, '1'), (2, '2'), (3, '3'), 
  (4, '4'), (5, '5'), (1, '5');

SELECT * FROM t;

EXPLAIN SELECT * FROM t WHERE a='3';
EXPLAIN SELECT * FROM t WHERE a=3;

CREATE INDEX idx_a ON t(a);
EXPLAIN SELECT * FROM t WHERE a='3';
EXPLAIN SELECT * FROM t WHERE a=3;

CREATE INDEX idx_b ON t(b);
EXPLAIN SELECT * FROM t WHERE b='3';
EXPLAIN SELECT * FROM t WHERE b=3;

SELECT CONVERT('안녕하세요' USING UTF8);
SELECT CAST("abc" AS BINARY);
SELECT CAST("1" AS UNSIGNED INTEGER) + 10;
SELECT CAST(123 AS CHAR CHARACTER SET UTF8);

SELECT TO_CHAR('2023-05-30 04:50:39', 'YYYY-MM-DD');
SELECT TO_CHAR('2023-05-30 16:50:39', 'HH24-MI-SS');
SELECT TO_CHAR('23-01-01 00:00:00', 'YY-MM-DD HH24:MI:SS');
SELECT TO_CHAR('23-12-31 23:59:59', 'YY-MM-DD HH24:MI:SS');
SELECT TO_CHAR('2023-12-31 23:59:59', 'YY-MM-DD HH24:MI:SS');
SELECT TO_CHAR('23-05-30 08:30:00', 'YYYY-MON-DY HH:MI:SS');

SELECT first_name, TO_CHAR(hire_date, 'YYYY"년" MM"월" DD"일"') AS hiredate 
FROM employees;

SET lc_time_names='ko_KR';
SELECT STR_TO_DATE('Wednesday, June 2, 2023', '%W, %M %e, %Y'); #2023-06-02
SELECT STR_TO_DATE('2023년 5월 23일 12:16:10', '%Y년 %m월 %d일 %H:%i:%s'); #2023-05-23 12:16:10
SELECT STR_TO_DATE('2023년 5월 23일 12:16:10', '%Y년 %m월 %d일 %H:%i:%s'); #2023-05-23 12:16:10

SELECT salary, 
	    FORMAT(salary, 2) AS salary1, 
		 FORMAT(salary, 2, 'de_DE') AS salary2, 
	    CONCAT('$', FORMAT(salary, 2)) AS salary3, 
		 LPAD(FORMAT(salary, 2), 10, '0') AS salary4,
		 CONCAT('$', LPAD(FORMAT(salary, 2), 10, '0')) AS salary5
FROM employees;


SELECT first_name, 
       salary + salary*NVL(commission_pct,0) AS ann_sal 
FROM   employees;


SELECT first_name, 
  NVL2(commission_pct, salary+(salary*commission_pct), salary) ann_sal 
FROM employees;

SELECT first_name, 
  COALESCE(salary + (salary*commission_pct), salary) AS ann_sal 
FROM employees;

SELECT * FROM employees WHERE commission_pct IS NOT NULL;
SELECT * FROM employees WHERE salary*commission_pct>2000;
SELECT first_name, salary, commission_pct,
IF(salary*commission_pct>2000, '> 2000', '<= 2000 or Null') AS info
FROM employees;


SELECT NULLIF(1,1);
SELECT NULLIF(1,2);
SELECT NULLIF(1,2);
SELECT  CASE WHEN 1 = 2 THEN NULL ELSE 1 END AS;
SELECT ENCODE('some text', 'p@$$w0rd');
# GRANT FILE ON *.* TO 'hr'@'localhost';
SELECT ENCODE('some text', 'p@$$w0rd') INTO OUTFILE 'encode.txt';
SELECT DECODE(ENCODE('some text', 'p@$$w0rd'), 'p@$$w0rd');


SELECT  job_id, salary,
        DECODE_ORACLE(job_id, 'IT_PROG',    salary*1.10,
                              'FI_MGR',     salary*1.15,
                              'FI_ACCOUNT', salary*1.20, 
                              salary)
        AS revised_salary
FROM    employees;

SELECT job_id, salary,
  CASE job_id WHEN 'IT_PROG'    THEN salary*1.10
              WHEN 'FI_MGR'     THEN salary*1.15
              WHEN 'FI_ACCOUNT' THEN salary*1.20
       ELSE salary
  END AS REVISED_SALARY
FROM   employees;

SELECT employee_id, salary,
    CASE WHEN salary < 5000  THEN salary*1.2
         WHEN salary < 10000 THEN salary*1.10
         WHEN salary < 15000 THEN salary*1.05
         ELSE salary
    END AS revised_salary
FROM employees;

SELECT employee_id, first_name
  FROM   employees
  WHERE  hire_date LIKE '2004%'
UNION
SELECT employee_id, first_name
  FROM   employees
  WHERE  department_id=20;
  
SELECT employee_id, first_name
  FROM   employees
  WHERE  hire_date LIKE '2004%'
UNION  ALL
SELECT employee_id, first_name
  FROM   employees
  WHERE  department_id=20;

SELECT employee_id, first_name
  FROM   employees
  WHERE  hire_date LIKE '2004%'
INTERSECT
SELECT employee_id, first_name
  FROM   employees
  WHERE  department_id=20;
   
SELECT employee_id, first_name
  FROM   employees
  WHERE  hire_date LIKE '2004%'
EXCEPT
SELECT employee_id, first_name
  FROM   employees
  WHERE  department_id=20;
  

# 연습문제
SELECT * FROM employees
WHERE email LIKE '%lee%'

SELECT first_name, salary, job_id 
FROM employees
WHERE manager_id=103;

SELECT * FROM employees
WHERE (department_id=80 AND job_id='SA_MAN')
  OR  (department_id=20 AND manager_id=100);
  
SELECT replace(phone_number, '.', '-') AS 전화번호
FROM employees;

SELECT 
  RPAD(CONCAT(first_name, ' ', last_name), 20, '*') AS full_name,
  CONCAT('$', LPAD(FORMAT(COALESCE(salary*commission_pct, salary), 2), 10, '0')) AS salary,
  TO_CHAR(hire_date, 'YYYY"년" MM"월" DD"일"') AS hiredate,
  DATEDIFF(NOW(), hire_date) AS work_day
FROM employees
WHERE UPPER(job_id) = 'IT_PROG' AND salary>5000
ORDER BY full_name;


SELECT salary, 
	    FORMAT(salary, 2) AS salary1, 
		 FORMAT(salary, 2, 'de_DE') AS salary2, 
	    CONCAT('$', FORMAT(salary, 2)) AS salary3, 
		 LPAD(FORMAT(salary, 2), 10, '0') AS salary4,
		 CONCAT('$', LPAD(FORMAT(salary, 2), 10, '0')) AS salary5
FROM employees;

SELECT hire_date + INTERVAL 1000 DAY 
FROM employees
WHERE first_name='Lex';

SELECT first_name, hire_date 
FROM employees
WHERE TO_CHAR(hire_date, 'MM')='05';

SELECT first_name, hire_date, 
       CONCAT(TRUNCATE(TIMESTAMPDIFF(YEAR, hire_date, CURDATE())/5, 0)*5, '년차') AS 근무년차
FROM employees
WHERE department_id=30;

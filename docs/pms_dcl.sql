--sqlplus에서 한글 insert시 에러
--C:\>set NLS_LANG=.AL32UTF8

set termout on
set echo on
set escape on

insert into USER_ROLE(NUM, NAME) values(1, 'Developer');
insert into USER_ROLE(NUM, NAME) values(2, 'Manager');
insert into USER_ROLE(NUM, NAME) values(3, 'Designer');
insert into USER_ROLE(NUM, NAME) values(4, 'Leader');

insert into TASK_PRIORITY(NUM, NAME, SOONSEO) values(1, 'Low', 1);
insert into TASK_PRIORITY(NUM, NAME, SOONSEO) values(2, 'Normal', 2);
insert into TASK_PRIORITY(NUM, NAME, SOONSEO) values(3, 'High', 3);
insert into TASK_PRIORITY(NUM, NAME, SOONSEO) values(4, 'Urgent', 4);

insert into TASK_STATUS(NUM, NAME, SOONSEO) values(1, 'New', 1);
insert into TASK_STATUS(NUM, NAME, SOONSEO) values(2, 'Assigned', 2);
insert into TASK_STATUS(NUM, NAME, SOONSEO) values(3, 'Open', 3);
insert into TASK_STATUS(NUM, NAME, SOONSEO) values(4, 'Resolve', 4);
insert into TASK_STATUS(NUM, NAME, SOONSEO) values(5, 'Reject', 5);
insert into TASK_STATUS(NUM, NAME, SOONSEO) values(6, 'Close', 6);

insert into TASK_TYPE(NUM, NAME) values(1, 'Environment');
insert into TASK_TYPE(NUM, NAME) values(2, 'Development');
insert into TASK_TYPE(NUM, NAME) values(3, 'Design');

insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(1, 'admin', 'admin', 'admin', 'admin', 'admin@naver.com', 'Y', 'Y', SYSDATE, SYSDATE, '192.168.50.33');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP, IS_EMAIL_DIRECT) values(2, 'khnam', '1234', '남', '기훈', 'khnam@jungang.com', 'Y', 'N', SYSDATE, SYSDATE, '192.168.50.33', 'Y');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(3, 'dyyoo', '1234', '유', '도연', 'dyyoo@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.29');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(4, 'hnshin', '1234', '신', '한나', 'hnshin@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.28');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(5, 'jgkim', '1234', '김', '진곤', 'jgkim@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.27');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(6, 'hjchoi', '1234', '최', '혜진', 'hjchoi@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.26');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(7, 'dglee', '1234', '이', '동근', 'dglee@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.25');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(8, 'ycsim', '1234', '심', '유찬', 'ycsim@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.24');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(9, 'shkim', '1234', '김', '석하', 'shkim@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.23');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(10, 'jjlee', '1234', '이', '진주', 'jjlee@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.22');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(11, 'hjkwon', '1234', '권', '혁준', 'hjkwon@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.21');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(12, 'shnam', '1234', '남', '상혁', 'shnam@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.20');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(13, 'ysjoo', '1234', '주', '요섭', 'ysjoo@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.39');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(14, 'shpark', '1234', '박', '성현', 'shpark@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.49');
insert into USERS(NUM, ID, PW, F_NAME, S_NAME, EMAIL, IS_AUTHORIZED, IS_ADMIN, REG_DATE, LAST_LOGIN_DATE, LOGIN_IP) values(15, 'hjmin', '1234', '민', '혜진', 'hjmin@naver.com', 'N', 'N', SYSDATE, SYSDATE, '192.168.50.59');

commit;

set termout off
set echo off
set escape off

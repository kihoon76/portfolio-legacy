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

commit;

set termout off
set echo off
set escape off

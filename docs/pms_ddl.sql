 
set termout on
set echo on
set escape on

/*
 * DROP TABLE
 */
drop table PROJECT_USER cascade constraints;
drop table PROJECT cascade constraints;
drop table USERS cascade constraints;
drop table USER_ROLE cascade constraints;
drop table TASK cascade constraints;
drop table TASK_PRIORITY cascade constraints;
drop table TASK_TYPE cascade constraints;
drop table TASK_STATUS cascade constraints;

/*
 * DROP SEQUENCE
 */
drop sequence PROJECT_SEQ;
drop sequence USERS_SEQ;
drop sequence USER_ROLE_SEQ;
drop sequence TASK_SEQ;
drop sequence TASK_PRIORITY_SEQ;
drop sequence TASK_TYPE_SEQ;
drop sequence TASK_STATUS_SEQ;


/*
 * CREATE SEQUENCE
 */
 create sequence PROJECT_SEQ start with 1;
 create sequence USERS_SEQ start with 16;
 create sequence USER_ROLE_SEQ start with 5;
 create sequence TASK_SEQ start with 1;
 create sequence TASK_PRIORITY_SEQ start with 5;
 create sequence TASK_TYPE_SEQ start with 4;
 create sequence TASK_STATUS_SEQ start with 7;
 
/*
 * 테이블 명 : PROJECT(프로젝트)
 * 컬럼 정보 :
 *   NUM			(프로젝트번호)
 *	 NAME 			(프로젝트명)
 *	 ALIAS			(프로젝트 식별자명)
 *	 DESCRIPTION	(프로젝트 상세설명)
 *	 IS_THE_PUBLIC	(공개여부)
 *	 START_DATE		(시작일)
 *	 END_DATE		(종료일)
 */
create table PROJECT (
	NUM				number(10),
	NAME			varchar2(50 char)	not null,
	ALIAS			varchar2(50 char)	not null,
	DESCRIPTION		varchar2(500 char),
	IS_THE_PUBLIC	char(1)				default 'Y' not null,
	START_DATE		date				not null,
	END_DATE		date				not null,
	constraint PK_PROJECT__NUM primary key (NUM),
	constraint CHK_PROJECT__PUBLIC check (IS_THE_PUBLIC IN ('Y','N')),
	constraint UQ_PROJECT__ALIAS unique (ALIAS),
	constraint UQ_PROJECT__NAME unique (NAME)
);

/*
 * 테이블 명 : USERS(사용자)
 * 컬럼 정보 :
 *   NUM				(사용자 번호)
 *	 ID 				(사용자 아이디)
 *	 PW					(사용자 패스워드)
 *	 F_NAME				(사용자 성)
 *	 S_NAME				(사용자 이름)
 *	 EMAIL				(사용자 이메일)
 *   IS_EMAIL_DIRECT	(이메일 직접입력 여부)
 *	 REG_DATE			(등록일)
 *	 LAST_LOGIN_DATE	(마지막 로그인 날짜)
 *	 LOGIN_IP			(로그인 IP)
 *	 IS_AUTHORIZED		(승인여부)
 *	 IS_ADMIN			(관리자여부)
 */
 
 create table USERS (
 	NUM				number(10),
	ID				varchar2(20 char)	not null,
	PW				varchar2(20 char)	not null,
	F_NAME			varchar2(10 char)	not null,
	S_NAME			varchar2(20 char)	not null,
	EMAIL			varchar2(50 char)	not null,
	IS_EMAIL_DIRECT char(1)				default 'N' not null,
	REG_DATE		date				not null,
	LAST_LOGIN_DATE date				not null,				
	LOGIN_IP		varchar2(15)		not null,
	IS_AUTHORIZED	char(1)				default 'N' not null,
	IS_ADMIN		char(1)				default 'N' not null,
	constraint PK_USERS__NUM primary key (NUM),
	constraint UQ_USERS__ID unique (ID),
	constraint CHK_USERS__IS_AUTHORIZED check (IS_AUTHORIZED IN('Y', 'N')),
	constraint CHK_USERS__IS_ADMIN check(IS_ADMIN IN ('Y','N')),
	constraint CHK_USERS__IS_EMAIL_DIRECT check(IS_EMAIL_DIRECT IN ('Y', 'N'))
 );
 
/*
 * 테이블 명 : USER_ROLE(사용자 역할)
 * 컬럼 정보 :
 *   NUM			(사용자 역할 번호)
 *	 NAME 			(역할명)
 */
 
 create table USER_ROLE (
 	NUM				number(10),
	NAME			varchar2(20 char)	not null,
	constraint PK_USER_ROLE__NUM primary key (NUM),
	constraint UQ_USER_ROLE__NAME unique (NAME)
 );

/*
 * 테이블 명 : PROJECT_USER(프로젝트 구성원)
 * 컬럼 정보 :
 *   PROJECT_NUM			(프로젝트 번호)
 *	 USER_NUM 				(사용자 번호)
 *	 USER_ROLE_NUM			(사용자 역할번호)
 */
 
 create table PROJECT_USER (
 	PROJECT_NUM				number(10),
	USER_NUM				number(10),
	USER_ROLE_NUM			number(10),
	constraint PK_PROJECT_USER__PJ_USR_RLE_NM primary key (PROJECT_NUM,USER_NUM,USER_ROLE_NUM),
	constraint FK_PROJECT_USER__PROJECT_NUM foreign key(PROJECT_NUM) references PROJECT (NUM),
	constraint FK_PROJECT_USER__USER_NUM foreign key (USER_NUM) references USERS(NUM),
	constraint FK_PROJECT_USER__USER_ROLE_NUM foreign key (USER_ROLE_NUM) references USER_ROLE(NUM)	
 );
 
/*
 * 테이블 명 : TASK_PRIORITY(일감 우선순위)
 * 컬럼 정보 :
 *   NUM					(우선순위번호)
 *	 NAME	 				(우선순위명)
 */
 
 create table TASK_PRIORITY (
 	NUM						number(10),
	NAME					varchar2(20 char)	not null,
	SOONSEO					number(2)			not null,
	constraint PK_TASK_PRIORITY__NUM primary key (NUM),
	constraint UQ_TASK_PRIORITY__NAME unique (NAME),
	constraint CHK_TASK_PRIORITY__SOONSEO check (SOONSEO>0)
 );
 
/*
 * 테이블 명 : TASK_TYPE(일감 유형)
 * 컬럼 정보 :
 *   NUM					(일감유형번호)
 *	 NAME	 				(일감유형명)
 */
 create table TASK_TYPE (
 	NUM						number(10),
	NAME					varchar2(20 char)	not null,
	constraint PK_TASK_TYPE__NUM primary key (NUM),
	constraint UQ_TASK_TYPE__NAME unique (NAME)
 );
 
/*
 * 테이블 명 : TASK_STATUS(일감 상태)
 * 컬럼 정보 :
 *   NUM					(일감상태번호)
 *	 NAME	 				(일감상태명)
 */
 create table TASK_STATUS (
 	NUM						number(10),
	NAME					varchar2(20 char)	not null,
	SOONSEO					number(2)			not null,
	constraint PK_TASK_STATUS__NUM primary key (NUM),
	constraint UQ_TASK_STATUS__NAME unique (NAME),
	constraint CHK_TASK_STATUS__SOONSEO check (SOONSEO>0)
 );
 
/*
 * 테이블 명 : TASK(일감)
 * 컬럼 정보 :
 *   NUM						(일감번호)
 *	 TYPE_NAME	 				(일감유형)
 *	 TITLE						(일감명)
 *	 DESCRIPTION				(일감설명)
 *	 STATUS_NUM					(일감상태)
 *	 PRIORITY_NUM				(일감우선순위)
 *	 RESPONSIBILITY_NUM			(일감 담당자)
 *	 START_DATE					(시작일)
 *	 END_DATE					(종료일)
 *	 PROGRESS					(진척률)
 *	 VIEWER_NUMS				(일감 지켜보는 사람들)
 *	 PROJECT_NUM				(프로젝트번호)
 *	 WRITE_DATE					(일감작성일자)
 *	 WRITE_USER_NUM				(일감작성자)
 */
 create table TASK (
 	NUM						number(10),
	TYPE_NUM				number(10)					not null,
	TITLE					varchar2(100 char)			not null,
	DESCRIPTION				varchar2(100 char),
	STATUS_NUM				number(10)					not null,
	PRIORITY_NUM			number(10)					not null,
	RESPONSIBILITY_NUM		number(10)					not null,
	START_DATE				date						not null,
	END_DATE				date						not null,
	PROGRESS				number(10)					default 0	not null,
	VIEWER_NUMS				varchar2(200),
	PROJECT_NUM				number(10)					not null,
	WRITE_DATE				date						not null,
	WRITE_USER_NUM			number(10)					not null,
	constraint PK_TASK__NUM primary key (NUM),
	constraint FK_TASK__TYPE_NUM foreign key (TYPE_NUM) references TASK_TYPE (NUM),
	constraint UQ_TASK__TITLE unique (TITLE),
	constraint FK_TASK__STATUS_NUM foreign key (STATUS_NUM) references TASK_STATUS (NUM),
	constraint FK_TASK__PRIORITY_NUM foreign key (PRIORITY_NUM) references TASK_PRIORITY (NUM),
	constraint FK_TASK__RESPONSIBILITY_NUM foreign key (RESPONSIBILITY_NUM) references USERS (NUM),
	constraint CHK_TASK_PROGRESS check (PROGRESS IN (0,10,20,30,40,50,60,70,80,90,100)),
	constraint FK_TASK__PROJECT_NUM foreign key (PROJECT_NUM) references PROJECT (NUM),
	constraint FK_TASK__WRITE_USER_NUM foreign key (WRITE_USER_NUM) references USERS (NUM)
 );


set termout off
set echo off
set escape off

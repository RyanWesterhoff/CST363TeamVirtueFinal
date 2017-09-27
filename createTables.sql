set echo off
set verify off

drop table sus_line;
drop table cases;
drop table investigator;
drop table clients;
drop table suspect;
drop table evidence;

create table investigator
(INVR_ID CHAR(4),
FName CHAR(10),
LName CHAR(15),
Phone_Number CHAR(12),
PRIMARY KEY (INVR_ID));

create table clients
(CLIENT_ID CHAR(4),
FName CHAR(10),
LName CHAR(15),
Phone_Number CHAR(12),
PRIMARY KEY (CLIENT_ID));

create table suspect
(SUS_ID CHAR(4),
FName CHAR(10),
LName CHAR(15),
Occupation CHAR(20),
PRIMARY KEY (SUS_ID));

create table evidence
(EVID_ID CHAR(4),
EVID_Type CHAR(20),
EVID_Date_Aquired DATE,
PRIMARY KEY (EVID_ID));

create table cases
(CASE_ID CHAR(4),
Client_ID CHAR(4),
INVR_ID CHAR(4),
Suspected_Indiscretion CHAR(20),
CASE_STATUS CHAR(6),
PRIMARY KEY (CASE_ID),
CONSTRAINT CASES_Client_ID FOREIGN KEY(Client_ID) references CLIENTS(CLIENT_ID),
CONSTRAINT INVESTIGATOR_INVR_ID FOREIGN KEY(INVR_ID) references INVESTIGATOR(INVR_ID));

create table sus_line
(Line_ID CHAR(4),
CASE_ID CHAR(4),
SUS_ID CHAR(4),
EVID_ID CHAR(4),
Status CHAR(20),
PRIMARY KEY (Line_ID),
CONSTRAINT SUS_LINE_SUS_Case_ID FOREIGN KEY(CASE_ID) references CASES(CASE_ID),
CONSTRAINT SUS_LINE_SUS_ID FOREIGN KEY(SUS_ID) references SUSPECT(SUS_ID),
CONSTRAINT SUS_LINE_EVID_ID FOREIGN KEY(EVID_ID) references EVIDENCE(EVID_ID));

drop sequence caseID;
drop sequence clientID;
drop sequence invrID;
drop sequence susLnID;
drop sequence susID;
drop sequence evidID;

create sequence caseID
	START WITH 0
	INCREMENT BY 1	
	MAXVALUE 9999
	MINVALUE 0
	NOCYCLE
	CACHE 20;
create sequence clientID 
	START WITH 0
	INCREMENT BY 1	
	MAXVALUE 9999
	MINVALUE 0
	NOCYCLE
	CACHE 20;
create sequence invrID
	START WITH 0
	INCREMENT BY 1	
	MAXVALUE 9999
	MINVALUE 0
	NOCYCLE
	CACHE 20;
create sequence susLnID
	START WITH 0
	INCREMENT BY 1	
	MAXVALUE 9999
	MINVALUE 0
	NOCYCLE
	CACHE 20;
create sequence susID
	START WITH 0
	INCREMENT BY 1	
	MAXVALUE 9999
	MINVALUE 0
	NOCYCLE
	CACHE 20;
create sequence evidID
	START WITH 0
	INCREMENT BY 1	
	MAXVALUE 9999
	MINVALUE 0
	NOCYCLE
	CACHE 20;




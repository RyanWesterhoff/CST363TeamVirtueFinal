set echo off
set verify off
SET LINESIZE 5000;
spool c:\users\greg\desktop\private_eye.txt

COLUMN Client_ID HEADING 'Client ID: ' FORMAT A10;
COLUMN FName HEADING 'First Name:' FORMAT A12;
COLUMN LName HEADING 'Last Name: ' FORMAT A12;
COLUMN Phone_Number HEADING 'Phone Number: ' FORMAT A14;
COLUMN SUS_ID HEADING 'Suspect ID: ' FORMAT A15;
COLUMN OCCUPATION HEADING 'Occupation: ' FORMAT A20;
COLUMN CASE_ID HEADING 'Case ID: ' FORMAT A10;
COLUMN INVR_ID HEADING 'Investigator ID:' FORMAT A16;
COLUMN suspected_indiscretion HEADING 'Suspected Indiscretion: ' FORMAT A25;
COLUMN CASE_Status HEADING 'Case Status: ' FORMAT A14;
COLUMN LINE_ID HEADING 'Line ID#: ' FORMAT A10;
COLUMN Status HEADING 'Suspect Status: ' FORMAT A25;
COLUMN EVID_ID HEADING 'Evidence ID: ' FORMAT A15;
COLUMN EVID_TYPE HEADING 'Evidence Type: ' FORMAT A15;
COLUMN EVID_Date_Aquired HEADING 'Date In: ' FORMAT A20;

start c:\users\greg\desktop\createTables.sql
start c:\users\greg\desktop\init.sql
start c:\users\greg\desktop\Queries.sql
start c:\users\greg\desktop\addInvestigator.sql
start c:\users\greg\desktop\addClient.sql
start c:\users\greg\desktop\addCase.sql
start c:\users\greg\desktop\addSuspect.sql
start c:\users\greg\desktop\addEvidence.sql
start c:\users\greg\desktop\assignSuspect.sql
start c:\users\greg\desktop\updateCase.sql
start c:\users\greg\desktop\updateClient.sql
start c:\users\greg\desktop\updateInvestigator.sql
start c:\users\greg\desktop\updateSusLine.sql
start c:\users\greg\desktop\updateSuspect.sql

spool off
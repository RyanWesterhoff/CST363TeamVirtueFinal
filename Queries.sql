
SET LINESIZE 5000;
COLUMN Client_ID HEADING 'Client ID: ' FORMAT A10;
COLUMN FName HEADING 'First Name:' FORMAT A12;
COLUMN LName HEADING 'Last Name: ' FORMAT A12;
COLUMN Phone_Number HEADING 'Phone Number: ' FORMAT A14;
COLUMN Client_Count HEADING 'Number of cases: ' FORMAT A4;

prompt "Here are our clients that have more than one active or inactive case with us: ";
select Clients.CLIENT_ID, FName, LName, Phone_Number, count(Clients.CLIENT_ID) AS "Number of Cases: "
from clients, cases
where Cases.CLIENT_ID  = Clients.CLIENT_ID
Group By Clients.CLIENT_ID, FName, LName, Phone_Number
HAVING count(Cases.Case_ID) > 1;

COLUMN SUS_ID HEADING 'Suspect ID: ' FORMAT A15;
COLUMN OCCUPATION HEADING 'Occupation: ' FORMAT A20;

prompt "Here are the suspects involved in multiple cases: ";
select suspect.SUS_ID, FNAME, LNAME, OCCUPATION, count(suspect.SUS_ID)  AS "Number of Investigations: " 
from suspect, sus_line 
where suspect.SUS_ID = SUS_LINE.SUS_ID 
GROUP BY suspect.SUS_ID, FNAME, LNAME, OCCUPATION 
HAVING count(suspect.SUS_ID) > 1;

COLUMN CASE_ID HEADING 'Case ID: ' FORMAT A10;
COLUMN INVR_ID HEADING 'Investigator ID:' FORMAT A16;
COLUMN suspected_indiscretion HEADING 'Suspected Indiscretion: ' FORMAT A25;
COLUMN CASE_Status HEADING 'Case Status: ' FORMAT A14;

prompt "Here are the details of cases that involve more than 1 suspect: ";
select Cases.CASE_ID, CLIENT_ID, INVR_ID, suspected_indiscretion, CASE_STATUS, count(SUS_LINE.SUS_ID) AS "Number of Suspects: "
from sus_line, cases
where Cases.CASE_ID = SUS_LINE.CASE_ID
GROUP BY Cases.CASE_ID, CLIENT_ID, INVR_ID, suspected_indiscretion, CASE_STATUS
HAVING count(SUS_LINE.SUS_ID) > 1;


prompt "Here are the suspects from closed cases who are unemployed: ";
select suspect.FNAME, suspect.LNAME, suspect.OCCUPATION
from suspect, sus_line, cases
where sus_line.SUS_ID = Suspect.SUS_ID 
AND sus_line.CASE_ID = Cases.CASE_ID
AND CASE_STATUS = 'Closed' 
AND OCCUPATION = 'Unemployed'; 

COLUMN EVID_ID HEADING 'Evidence ID: ' FORMAT A15;
COLUMN EVID_TYPE HEADING 'Evidence Type: ' FORMAT A15;
COLUMN EVID_Date_Aquired HEADING 'Date In: ' FORMAT A20;

prompt "Here are the pieces of evidence in open cases that were logged between 01-jan-15 and 31-dec-15, and the suspects associated with them: ";
select SUS_LINE.SUS_ID, suspect.FName, suspect.LName, Evidence.EVID_ID, EVID_Type, EVID_Date_Aquired
from SUS_LINE, suspect, evidence 
where SUS_LINE.SUS_ID = suspect.SUS_ID
AND SUS_LINE.EVID_ID = Evidence.EVID_ID
AND EVID_Date_Aquired between '01-jan-15' AND '31-dec-15';


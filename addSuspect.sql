set feedback off;
prompt "This demonstrates the addSuspect.sql script:";

variable new_sus_id char(4);
exec :new_sus_id := susID.NEXTVAL;

variable new_evid_id char(4);
exec :new_evid_id := evidID.NEXTVAL;

variable evid_date VARCHAR2(20);
exec :evid_date := sysdate;

variable new_susLn_id char(4);
exec :new_susLn_id := susLnID.NEXTVAL;

accept CASE_NUM prompt "Please enter the case number for this suspect: ";
accept FNAME prompt "Please enter the first name of the suspect: ";
accept LNAME prompt "Please enter the last name of the suspect: ";
accept OCCUP prompt "Please enter the occupation of the suspect: ";
accept EV_TYPE prompt "Please enter the type of evidence for this suspected indiscretion: ";

INSERT INTO suspect VALUES (:new_sus_id, '&FNAME', '&LNAME', '&OCCUP');
prompt;
prompt The following suspect record has been added: ;

SELECT SUS_ID, FName, LName, Occupation 
FROM suspect
WHERE SUS_ID = :new_sus_id 
AND FName = '&FNAME' 
AND LName = '&LNAME' 
AND Occupation = '&OCCUP';

INSERT INTO evidence VALUES (:new_evid_id, '&EV_TYPE', :evid_date);
prompt;
prompt The following record has been added: ;

SELECT EVID_ID, EVID_Type, EVID_Date_Aquired
FROM evidence
WHERE EVID_ID = :new_evid_id 
AND EVID_Type = '&EV_TYPE'
AND EVID_Date_Aquired = to_date(:evid_date);

INSERT INTO sus_line 
VALUES (:new_susLn_id, '&CASE_NUM', :new_sus_id, :new_evid_id, 'Investigating');

SELECT Line_ID, CASE_ID, SUS_ID, EVID_ID, Status
FROM sus_line
WHERE Line_ID = :new_susLn_id 
AND CASE_ID = '&CASE_NUM'
AND SUS_ID = :new_sus_id
AND EVID_ID = :new_evid_id
AND Status = 'Investigating';

Commit;
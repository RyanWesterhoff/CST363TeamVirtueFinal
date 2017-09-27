set feedback off;
prompt "This demonstrates the assignSuspect.sql script:";

variable new_evid_id char(4);
exec :new_evid_id := evidID.NEXTVAL;

variable evid_date VARCHAR2(20);
exec :evid_date := sysdate;

variable new_susLn_id char(4);
exec :new_susLn_id := susLnID.NEXTVAL;

accept CASE_NUM prompt "Please enter the case number for this suspect: ";
accept SUSID prompt "Please enter the suspect ID number: ";
accept EV_TYPE prompt "Please enter the type of evidence for this suspected indiscretion: ";

INSERT INTO evidence VALUES (:new_evid_id, '&EV_TYPE', :evid_date);
prompt The following record has been added: ;

SELECT EVID_ID, EVID_Type, EVID_Date_Aquired 
FROM evidence
WHERE EVID_ID = :new_evid_id 
AND EVID_Type = '&EV_TYPE'
AND EVID_Date_Aquired = to_date(:evid_date);

INSERT INTO sus_line 
VALUES (:new_susLn_id, '&CASE_NUM', '&SUSID', :new_evid_id, 'Investigating');


SELECT Line_ID, CASE_ID, SUS_ID, EVID_ID, Status
FROM sus_line
WHERE Line_ID = :new_susLn_id 
AND CASE_ID = '&CASE_NUM'
AND SUS_ID = '&SUSID'
AND EVID_ID = :new_evid_id
AND Status = 'Investigating';

Commit;
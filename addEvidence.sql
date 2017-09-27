set echo off
set verify off
prompt "This demonstrates the addEvidence.sql script:";

variable new_evid_id char(4);
exec :new_evid_id := evidID.NEXTVAL;

variable evid_date VARCHAR2(20);
exec :evid_date := sysdate;

variable new_susLn_id char(4);
exec :new_susLn_id := susLnID.NEXTVAL;

accept CASENUM prompt "Please enter the case number for this evidence: ";
accept SUID prompt "Please enter the suspect ID associated with this evidence: ";
accept EV_TYPE prompt "Please enter the type of evidence: ";

INSERT INTO evidence VALUES (:new_evid_id, '&EV_TYPE', :evid_date);
prompt "The following record has been added: ";

SELECT EVID_ID, EVID_Type, EVID_Date_Aquired 
FROM evidence
WHERE EVID_ID = :new_evid_id 
AND EVID_Type = '&EV_TYPE'
AND EVID_Date_Aquired = to_date(:evid_date);

INSERT INTO sus_line 
VALUES (:new_susLn_id, '&CASENUM', '&SUID', :new_evid_id, 'Investigating');

SELECT Line_ID, CASE_ID, SUS_ID, EVID_ID, Status
FROM sus_line
WHERE Line_ID = :new_susLn_id 
AND CASE_ID = '&CASENUM'
AND SUS_ID = '&SUID'
AND EVID_ID = :new_evid_id
AND Status = 'Investigating';

Commit;
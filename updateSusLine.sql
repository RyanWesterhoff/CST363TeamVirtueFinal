set feedback off;

prompt "This demonstrates the updateSusLine.sql script: ";

accept CSID prompt "Please enter the case ID number: ";
accept SUID prompt "Please enter the suspect ID number: ";
accept STAT prompt "Please enter the new suspect status: ";

UPDATE sus_line
SET Status = '&STAT'
WHERE CASE_ID = '&CSID'
AND SUS_ID = '&SUID';

prompt Suspect status updated: ;

SELECT Line_ID, CASE_ID, SUS_ID, EVID_ID, Status
FROM sus_line
WHERE CASE_ID = '&CSID'
AND SUS_ID = '&SUID'
AND Status = '&STAT';

commit;
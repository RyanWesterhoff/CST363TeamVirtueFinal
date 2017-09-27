set feedback off;

prompt "This demonstrates the updateCase.sql script: ";

accept CSID prompt "Please enter the case ID number: "
accept STAT prompt "Please enter the new case status: ";

UPDATE cases
SET CASE_STATUS = '&STAT'
WHERE CASE_ID = '&CSID';

prompt Case status updated: ;

SELECT CASE_ID, Client_ID, INVR_ID, Suspected_Indiscretion, CASE_STATUS
FROM cases
WHERE CASE_ID = '&CSID';

commit;
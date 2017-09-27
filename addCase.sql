set feedback off;
prompt "This demonstrates the addCase.sql script:";

variable new_case_id char(4);
exec :new_case_id := caseID.NEXTVAL;

accept INVRID prompt "Please enter the ID of the investigator: "
accept CLID prompt "Please enter the client ID number: ";
accept INDISC prompt "Please enter the suspected indiscretion of the suspect(s): ";

INSERT INTO cases VALUES (:new_case_id, '&CLID', '&INVRID', '&INDISC', 'Open');
prompt A new case has been created: ;

COLUMN client FORMAT A6;
COLUMN INVESTIGATOR FORMAT A12;

SELECT CASE_ID, CLIENT_ID, INVR_ID, Suspected_Indiscretion, CASE_STATUS 
FROM cases
WHERE CASE_ID = :new_case_id 
AND CLIENT_ID = '&CLID' 
AND INVR_ID = '&INVRID'
AND Suspected_Indiscretion = '&INDISC'
AND CASE_STATUS = 'Open';

commit;
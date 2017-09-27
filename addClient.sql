set feedback off;
prompt "This demonstrates the addClient.sql script:";

variable new_client_id char(4);
exec :new_client_id := clientID.NEXTVAL;

variable new_case_id char(4);
exec :new_case_id := caseID.NEXTVAL;

accept INVRID prompt "Please enter the ID of the investigator: "
accept FNAME prompt "Please enter the first name of the client: ";
accept LNAME prompt "Please enter the last name of the client: ";
accept PHONE prompt "Please enter the phone number of the client: ";
accept INDISC prompt "Please enter the suspected indiscretion of the suspect(s): ";

INSERT INTO clients VALUES (:new_client_id, '&FNAME', '&LNAME', '&PHONE');
prompt The following record has been added: ;

SELECT CLIENT_ID, FName, LName, Phone_Number
FROM clients
WHERE CLIENT_ID = :new_client_id 
AND FName = '&FNAME' 
AND LName = '&LNAME' 
AND Phone_Number = '&PHONE';


INSERT INTO cases VALUES (:new_case_id, :new_client_id, '&INVRID', '&INDISC', 'Open');
prompt;
prompt A new case has been created: ;


SELECT CASE_ID, CLIENT_ID, INVR_ID, Suspected_Indiscretion, CASE_STATUS
FROM cases
WHERE CASE_ID = :new_case_id 
AND CLIENT_ID = :new_client_id 
AND INVR_ID = '&INVRID'
AND Suspected_Indiscretion = '&INDISC'
AND CASE_STATUS = 'Open';

commit;
set feedback off;

prompt "This demonstrates the updateClient.sql script: ";

accept CLID prompt "Please enter the client ID number: "
accept FNAME prompt "Please enter the new first name of the client: ";
accept LNAME prompt "Please enter the new last name of the client: ";
accept PHONE prompt "Please enter the new phone number of the client: ";

UPDATE clients
SET FName = '&FNAME', 
LName = '&LNAME', 
Phone_Number = '&PHONE'
WHERE CLIENT_ID = '&CLID';

prompt "Client info updated: ";

SELECT CLIENT_ID, FName, LName, Phone_Number
FROM clients
WHERE CLIENT_ID = '&CLID' 
AND FName = '&FNAME' 
AND LName = '&LNAME'
AND Phone_Number = '&PHONE';

commit;
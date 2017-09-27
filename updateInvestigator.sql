set feedback off;

prompt "This demonstrates the updateInvestigator.sql script: ";

accept INVID prompt "Please enter the investigator ID number: ";
accept FNAME prompt "Please enter the new first name of the investigator: ";
accept LNAME prompt "Please enter the new last name of the investigator: ";
accept PHONE prompt "Please enter the new phone number of the investigator: ";

UPDATE investigator
SET FName = '&FNAME', 
LName = '&LNAME', 
Phone_Number = '&PHONE'
WHERE INVR_ID = '&INVID';

prompt The following investigator record has been updated: ;

SELECT INVR_ID, FName, LName, Phone_Number
FROM investigator
WHERE INVR_ID = '&INVID' 
AND FName = '&FNAME' 
AND LName = '&LNAME' 
AND Phone_Number = '&PHONE';

commit;
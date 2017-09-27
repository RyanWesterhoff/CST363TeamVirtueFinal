set echo off
set verify off
prompt "This demonstrates the addInvestigator.sql script:";

variable new_invr_id char(4);
exec :new_invr_id := invrID.NEXTVAL;

accept FNAME prompt "Please enter the first name of the investigator: ";
accept LNAME prompt "Please enter the last name of the investigator: ";
accept PHONE prompt "Please enter the phone number of the investigator: ";

INSERT INTO investigator VALUES (:new_invr_id, '&FNAME', '&LNAME', '&PHONE');

prompt "The following investigator record has been added: ";

SELECT INVR_ID, FName, LName, Phone_Number 
FROM investigator
WHERE INVR_ID = :new_invr_id 
AND FName = '&FNAME' 
AND LName = '&LNAME' 
AND Phone_Number = '&PHONE';

commit;
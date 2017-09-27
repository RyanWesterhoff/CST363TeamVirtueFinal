set feedback off;

prompt "This demonstrates the updateSuspect.sql script: ";

accept SUID prompt "Please enter the suspect ID number: "
accept FNAME prompt "Please enter the new first name of the suspect: ";
accept LNAME prompt "Please enter the new last name of the suspect: ";
accept OCCUP prompt "Please enter the new occupation of the suspect: ";

UPDATE suspect
SET FName = '&FNAME', 
LName = '&LNAME', 
Occupation = '&OCCUP'
WHERE sus_ID = '&SUID';

prompt Suspect info updated: ;

SELECT SUS_ID, FName, LName, Occupation
FROM suspect
WHERE SUS_ID = '&SUID' 
AND FName = '&FNAME' 
AND LName = '&LNAME'
AND Occupation = '&OCCUP';

commit;
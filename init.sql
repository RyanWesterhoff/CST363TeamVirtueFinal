--							   INVR_ID,  FNAME,  LNAME,   PHONE			 
INSERT INTO Investigator VALUES(invrID.NEXTVAL, 'Dick', 'Tracey', '123-456-7890');
INSERT INTO Investigator VALUES(invrID.NEXTVAL, 'Rick', 'Deckard', '456-820-4657');
INSERT INTO Investigator VALUES(invrID.NEXTVAL, 'Sam', 'Spade', '987-523-1456');
INSERT INTO Investigator VALUES(invrID.NEXTVAL, 'Thomas', 'Magnum', '695-243-6985');

--						CLIENT_ID,  FNAME,  LNAME,   PHONE			
INSERT INTO Clients VALUES(clientID.NEXTVAL, 'Lucy', 'Jones', '654-987-3126');
INSERT INTO Clients VALUES(clientID.NEXTVAL, 'Jim', 'Ring', '452-962-3547');
INSERT INTO Clients VALUES(clientID.NEXTVAL, 'Henery', 'Winkler', '852-987-2463');
INSERT INTO Clients VALUES(clientID.NEXTVAL, 'Georgia', 'Peach', '656-995-7521');

--						  SUS_ID,  FNAME,  LNAME,     Occupation	
INSERT INTO Suspect VALUES(susID.NEXTVAL, 'Joe', 'Shadyguy', 'Unemployed');
INSERT INTO Suspect VALUES(susID.NEXTVAL, 'Vallerie', 'Nerdowell', 'Lawyer');
INSERT INTO Suspect VALUES(susID.NEXTVAL, 'Rick', 'Stabbington', 'Watch Salesman');
INSERT INTO Suspect VALUES(susID.NEXTVAL, 'Herbie', 'Arsonwells', 'Brick Layer');
INSERT INTO Suspect VALUES(susID.NEXTVAL, 'Boris', 'Anklebreaker', 'Ankle Breaker');
INSERT INTO Suspect VALUES(susID.NEXTVAL, 'Steve', 'Slapstick', 'Comedian');

--						  EVID_ID,  TYPE,	Date Aquired	
INSERT INTO Evidence VALUES(evidID.NEXTVAL, 'Weapon', '11-mar-15');
INSERT INTO Evidence VALUES(evidID.NEXTVAL, 'Clothing', '02-oct-15');
INSERT INTO Evidence VALUES(evidID.NEXTVAL, 'Weapon', '01-jan-01');
INSERT INTO Evidence VALUES(evidID.NEXTVAL, 'Note', '03-apr-08');
INSERT INTO Evidence VALUES(evidID.NEXTVAL, 'Clothing', '06-sep-08');
INSERT INTO Evidence VALUES(evidID.NEXTVAL, 'Weapon', '05-jun-02');

--					  Case_ID, Client_ID, INVR_ID, Suspected Indiscretion, Status
INSERT INTO cases VALUES(caseID.NEXTVAL, '1', '1', 'Arson', 'Closed');
INSERT INTO cases VALUES(caseID.NEXTVAL, '2', '2', 'Debauchery', 'Closed');
INSERT INTO cases VALUES(caseID.NEXTVAL, '3', '1', 'Drug Trafficking', 'Open');
INSERT INTO cases VALUES(caseID.NEXTVAL, '3', '2', 'Robbing a Bank', 'Open');
INSERT INTO cases VALUES(caseID.NEXTVAL, '4', '3', 'Cheating', 'Open');
INSERT INTO cases VALUES(caseID.NEXTVAL, '4', '4', '2nd Family', 'Open');

--						  Line_ID,  CASE_ID, SUS_ID, EVID_ID, Status
INSERT INTO sus_line VALUES(susLnID.NEXTVAL, '1', '1', '1', 'Convicted');
INSERT INTO sus_line VALUES(susLnID.NEXTVAL, '2', '2', '2', 'Convicted');
INSERT INTO sus_line VALUES(susLnID.NEXTVAL, '3', '3', '3', 'Investigating');
INSERT INTO sus_line VALUES(susLnID.NEXTVAL, '4', '4', '4', 'Investigating');
INSERT INTO sus_line VALUES(susLnID.NEXTVAL, '3', '5', '3', 'Investigating');
INSERT INTO sus_line VALUES(susLnID.NEXTVAL, '4', '6', '4', 'Investigating');
INSERT INTO sus_line VALUES(susLnID.NEXTVAL, '5', '5', '5', 'Investigating');
INSERT INTO sus_line VALUES(susLnID.NEXTVAL, '6', '6', '6', 'Investigating');


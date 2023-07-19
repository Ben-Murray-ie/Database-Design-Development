-- Database Design & Developement SQL Query Script - G00275740

------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT STATEMENTS
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- This select statement can be used to aggregate all the information normally contained in a patient's chart. A where clause can be used to show a specific users record, or records of a specific appointment. Returns records on a per operation performed basis.

SELECT patients.PatID, patients.PatAddress, patients.PatFullName, appointments.AppID, appointments.PatientFK, appointments.AppDate, appointments.AppTime, appointments.AppCancel, appointments.AppFirst, performed.TreatFK, bills.BillRef, payments.Paid, payments.SpecReportSubmitted FROM patients 
INNER JOIN appointments ON patients.PatID = appointments.PatientFK
INNER JOIN performed ON appointments.AppID = performed.TreatFK
INNER JOIN bills ON appointments.AppID = bills.BillRef
INNER JOIN payments ON bills.BillRef = payments.PayRef;
--Examples of WHERE statements to narrow the scope of the selection to a specific appointment or patient. As each patient and appointment can both have multiple treatments performed, multiple records can be expected when using the WHERE statements below.
--WHERE appointments.AppID = 1;
--WHERE patients.PatID = 1;

-- This statement will make the aggregated info related to patients charts into a view that can be accessed and utilized by the dentist or secretary.

--Include this line as database export script includes creation of this view as standard: DROP VIEW IF EXISTS patientscharts;

CREATE VIEW Patients_Charts AS
SELECT patients.PatID, patients.PatFullName, patients.PatAddress, appointments.AppID, appointments.AppDate, appointments.AppTime, appointments.AppCancel, appointments.AppFirst, performed.TreatFK, bills.BillRef, payments.Paid, payments.SpecReportSubmitted FROM patients 
INNER JOIN appointments ON patients.PatID = appointments.PatientFK
INNER JOIN performed ON appointments.AppID = performed.TreatFK
INNER JOIN bills ON appointments.AppID = bills.BillRef
INNER JOIN payments ON bills.BillRef = payments.PayRef;

-- MariaDB generates the above view using the following statement:

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patients_charts` AS select `patients`.`PatID` AS `PatID`,`patients`.`PatAddress` AS
`PatAddress`,`patients`.`PatFullName` AS `PatFullName`,`appointments`.`AppID` AS `AppID`,`appointments`.`PatientFK` AS `PatientFK`,`appointments`.`AppDate` AS `AppDate`,`appointments`.`AppTime` AS
`AppTime`,`appointments`.`AppCancel` AS `AppCancel`,`appointments`.`AppFirst` AS `AppFirst`,`performed`.`TreatFK` AS `TreatFK`,`bills`.`BillRef` AS `BillRef`,`payments`.`Paid` AS
`Paid`,`payments`.`SpecReportSubmitted` AS `SpecReportSubmitted` from ((((`patients` join `appointments` on(`patients`.`PatID` = `appointments`.`PatientFK`)) join `performed` on(`appointments`.`AppID` =
`performed`.`TreatFK`)) join `bills` on(`appointments`.`AppID` = `bills`.`BillRef`)) join `payments` on(`bills`.`BillRef` = `payments`.`PayRef`));

-- The following generates a more concise version of a patients chart view, with records on a per-appointment basis, rather than a per-operation-performed basis. This makes the view easier to read for the end-user, at the cost of functionality.

CREATE VIEW Patients_Charts_Abridged AS
SELECT patients.PatID, patients.PatFullName, patients.PatAddress, appointments.AppID, appointments.AppDate, appointments.AppTime, appointments.AppCancel, appointments.AppFirst, bills.BillRef, payments.Paid, payments.SpecReportSubmitted FROM patients 
INNER JOIN appointments ON patients.PatID = appointments.PatientFK
INNER JOIN bills ON appointments.AppID = bills.BillRef
INNER JOIN payments ON bills.BillRef = payments.PayRef;

------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT STATEMENTS
------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* This script will insert records representing a new patients first passage through all distinct phases of visiting Mulcahy Dentist. They will make an appointment, have their details recorded, receive treatment, be billed for treatments received and a record will be made of their payments. Insertion of multiple records into multiple tables is achieved using an SQL transaction.*/

BEGIN;
INSERT INTO patients (PatID, PatFirstName, PatLastName, PatFullName, PatAddress, PatContact, PatDOB, PatGender) VALUES ('11', 'Robert', 'Norton','' , '18 Windsor Court', 'rnorton@mymail.com', '1977-07-11', 'Male');
INSERT INTO appointments (AppID, AppDate, AppTime, AppCancel, AppFirst, PatientFK) VALUES ('21', '2022-03-07', '14:45:00', '0', '1', '11');
INSERT INTO performed (PerfID, AppFK, TreatFK, NumPerformed, SubTotal) VALUES ('26', '21', '14', '2', '1600');
INSERT INTO bills (BillTotal, BillDueDate, BillPaymentPlan) VALUES ('1600', '2022-03-14', '0');
INSERT INTO payments (Paid, PayDate, PayMethod, SpecReportSubmitted) VALUES ('0', NULL ,NULL, '0');
COMMIT;

-- Please remember to show all/increase number of rows to 50+ for performed table, as there will be more than the default 25 records after this update.

------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE STATEMENTS
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Again, a transaction can be used both update multiple rows on multiple tables and verify that the update was successful as the transaction will be rolled back on an unsuccessful attempt.

BEGIN;
UPDATE patients SET PatFirstName = 'Lawrence', PatLastName = 'Moreno', PatAddress = '18 Evergreen Terrace', PatContact = 'lmoreno@mymail.com', PatDOB = '1987-10-12',PatGender = 'Other' WHERE PatID = 11;
UPDATE appointments SET AppDate = '2022-03-08', AppTime = '09:30:00' WHERE AppID = 21;
UPDATE performed SET TreatFK = '3', NumPerformed = '4', SubTotal = '2000' WHERE PerfID = 26;
UPDATE bills SET BillTotal = '2000', BillDueDate = '2022-03-15' WHERE BillRef = 21;
COMMIT;

------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DELETE STATEMENTS
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Finally, the database can be restored to it's state before the insert and update statements were applied by inputting the following DELETE statements, again contained within an SQL transaction for convenience and to preserve the integrity of the database.

BEGIN;
DELETE FROM payments WHERE PayRef = 21;
DELETE FROM bills WHERE BillRef = 21;
DELETE FROM performed WHERE PerfID = 26;
DELETE FROM appointments WHERE AppID = 21;
DELETE FROM patients WHERE PatID = 11;
COMMIT;

-- Clearly, if this script is run as is, without breaking it into it's constituent parts, it will appear as if the database has not been altered because the changes made in the INSERT and UPDATE portions are deleted by the last statement.
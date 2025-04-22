-- Formatting Setup
SET LINESIZE 150
SET PAGESIZE 50
SET COLSEP " | "
COLUMN TRADE_NAME FORMAT A20
COLUMN FORMULA FORMAT A30
COLUMN COMPANY_NAME FORMAT A20
COLUMN PRESCRIPTION_DATE FORMAT A12
COLUMN NAME FORMAT A25
COLUMN ADDRESS FORMAT A40
SET SERVEROUTPUT ON
SET VERIFY OFF

-- 1. Add/Update/Delete Pharmacy (Test)
EXEC ManagePharmacy('ADD', 'Test Pharmacy', '123 Test Lane', '+91-9999999999');
SELECT * FROM Pharmacy WHERE Name = 'Test Pharmacy';

--Test for Prescribe
-- Test 1: Add new prescription
EXEC ManagePrescription('ADD', '876543210987', '987654321098', 'Cetirizine', 'Natco', DATE '2025-04-22', 3);
SELECT * FROM Prescribes 
WHERE PatientID = '876543210987' 
AND DoctorID = '987654321098' 
AND Trade_Name = 'Cetirizine';

-- Test 2: Update prescription quantity
EXEC ManagePrescription('UPDATE', '987654321098', '123456789012', 'Aspirin', 'Abbott India', DATE '2025-04-11', 5);
SELECT Prescription_Date, Quantity 
FROM Prescribes
WHERE PatientID = '987654321098'
AND Trade_Name = 'Aspirin';

-- Test 3: Delete existing prescription
EXEC ManagePrescription('DELETE', '987654321098', '123456789012', 'Aspirin', 'Abbott India');
SELECT * FROM Prescribes 
WHERE PatientID = '987654321098' 
AND Trade_Name = 'Aspirin';

-- Test 4: Attempt invalid update (non-existent prescription)
EXEC ManagePrescription('UPDATE', '999999999999', '000000000000', 'FakeDrug', 'NoCompany', SYSDATE, 10);

-- Test 5: Add prescription with future date
EXEC ManagePrescription('ADD', '112233445566', '798512347812', 'Metformin', 'Biocon', DATE '2025-12-31', 10);
SELECT * FROM Prescribes
WHERE Prescription_Date > DATE '2025-12-30';

-- 2. Prescription Report for Patient 876543210987 (April 2025)
EXEC patient_prescriptions_report('876543210987', DATE '2025-04-01', DATE '2025-04-30');


-- 3. Prescription Details for Patient 876543210987 on 2025-04-11
-- Test 1: Valid prescription (from insert_data.sql)
EXEC PrintPrescriptionDetails('876543210987', DATE '2025-04-22');

-- Expected Output:
-- Prescription Details for Anika Trivedi
-- Date: 22-APR-2025
-- -------------------------------------------
-- Doctor: Dr. Swati Mishra
-- Specialty: Pediatrics
-- Medication: Cetirizine
-- Company: Natco
-- Formula: C21H25ClN2O5
-- Quantity: 3
-------------------------------------------


-- Test 2: No prescriptions
EXEC PrintPrescriptionDetails('876543210987', DATE '2025-01-01');

-- Expected Output:
-- No prescriptions found for this date

-- Test 3: Invalid patient
EXEC PrintPrescriptionDetails('000000000000', SYSDATE);

-- Expected Output:
-- Error: Patient 000000000000 not found




-- 4. Drugs by Sun Pharma
VARIABLE drugs REFCURSOR
EXEC :drugs := GetCompanyDrugs('Sun Pharma');
PRINT drugs

-- 5. Stock Position of Apollo Pharmacy
VARIABLE stock REFCURSOR
EXEC GetStockPosition('Apollo Pharmacy', :stock);
PRINT stock

-- 6. Contact Details for Apollo Pharmacy & Sun Pharma
VARIABLE ph_phone VARCHAR2(15)
VARIABLE co_phone VARCHAR2(15)
EXEC GetContactDetails('Apollo Pharmacy', 'Sun Pharma', :ph_phone, :co_phone);
PRINT ph_phone
PRINT co_phone

-- 7. Patients for Doctor 123456789012 (Dr. Alok Pandey)
VARIABLE patients REFCURSOR
EXEC :patients := GetDoctorPatients('123456789012');
PRINT patients


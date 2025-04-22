# NOVA Pharmacy Database Management System

A comprehensive relational database project developed for **CS F212 - Database Systems** at **BITS Pilani, Hyderabad Campus**.

---

## Project Scope

The system stores and maintains detailed information on:
- Pharmacies in the NOVA chain  
- Pharmaceutical firms and their medications  
- Doctors, patients, and prescriptions  
- Pharmacy–pharmaceutical company contracts  
- Stock and prices of drugs in several pharmacies  

It incorporates:
- ER/EER modeling  
- Relational schema design and normalization  
- Full SQL/PLSQL implementation  

### Features Implemented:
- Table creation with constraints  
- Insertion, update, and deletion of records  
- Report generation through stored procedures/functions  
- Enforcement of complex business rules through PL/SQL  

---

## Key Functionalities

### Data Operations:
- Add, delete, and update:
  - Pharmacies  
  - Pharmaceutical Firms  
  - Patients  
  - Physicians  
  - Medicines  
  - Prescriptions  
  - Agreements (Contracts)  

### Report Generation:
- Patient prescription history over a given period  
- Prescription details for a particular date  
- Medicines produced by a pharmaceutical company  
- Pharmacy stock position  
- Contact information between pharma companies and pharmacies  
- List of patients for a physician  

> All operations are processed through PL/SQL procedures and functions, not direct SQL queries.

---

## Technologies Used

- SQL/PLSQL  
- Oracle RDBMS  
  *(Adaptable for MySQL or SQL Server)*  
- Command-line interface (CLI)  
  *(GUI is optional and not required)*  

---

## Project Structure
├── schema
├── create_tables.sql 
├── insert_initial_data.sql 
└── drop_all_tables.sql 
├── procedures
├── add_data_procedures.sql 
├── report_generation_procedures.sql 
└── update_delete_functions.sql

## Academic Details

- Course: CS F212 - Database Systems  
- Faculty: Prof. R. Gururaj  
- Semester: Spring 2025  
- Institution: BITS Pilani, Hyderabad Campus  

---

## Academic Integrity

This project adheres to academic integrity policies.  
Unauthorized copying or reuse of any part of the code is strictly prohibited.

    

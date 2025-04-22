-- main.sql
-- Drop and recreate all tables
@"D:/Bits Hyderabad_Campus Diaries/DBMS Project/Report/create_tables.sql"
-- Compile procedures/functions
@"D:/Bits Hyderabad_Campus Diaries/DBMS Project/Report/procedures.sql"

-- Enable output formatting
SET SERVEROUTPUT ON
SET LINESIZE 150
SET PAGESIZE 50

@"D:/Bits Hyderabad_Campus Diaries/DBMS Project/Report/test_queries.sql"

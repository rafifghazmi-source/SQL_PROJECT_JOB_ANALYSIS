-- P.S: Please ensure that the CSV files are located in the specified directory before running this script!

COPY company_dim
FROM 'C:\Users\User\Documents\VSCODE - SQL\SQL PROJECT LUKE BAROUSSE\csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:\Users\User\Documents\VSCODE - SQL\SQL PROJECT LUKE BAROUSSE\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:\Users\User\Documents\VSCODE - SQL\SQL PROJECT LUKE BAROUSSE\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:\Users\User\Documents\VSCODE - SQL\SQL PROJECT LUKE BAROUSSE\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');



-- Test the data load by selecting the first 100 rows from each table
SELECT *
FROM job_postings_fact
LIMIT 100;

SELECT *
FROM company_dim
LIMIT 100;

SELECT *
FROM skills_dim
LIMIT 100;

SELECT *
FROM skills_job_dim
LIMIT 100;
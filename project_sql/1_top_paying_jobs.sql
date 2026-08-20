/*
Question: What are the top-paying data science jobs?
- Identify the top 10 highest-paying Data Scientist roles that are available remotely.
- Focuses on job postings with specified salaries (remote nulls)
- Why? Highlight the top-paying opportunities for Data Scientists, offering insights into employment trends.
*/



SELECT
    job_id AS "Job ID",
    job_title AS "Job Title",
    job_location AS "Location",
    job_schedule_type AS "Schedule Type",
    salary_year_avg AS "Average Salary (Yearly)",
    job_posted_date AS "Posted Date",
    company_dim.name AS "Company Name"
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title = 'Data Scientist' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL 
ORDER BY
    salary_year_avg DESC
LIMIT 10;

/*
Step by step explanation:
1. SELECT Clause: This part of the query specifies the columns to be retrieved from the database. It includes job_id, job_title, job_location, job_schedule_type, salary_year_avg, job_posted_date, and company_dim.name (the name of the company associated with the job posting).
2. FROM Clause: This indicates the primary table from which to retrieve the data, which is job_postings_fact.
3. WHERE Clause: This filters the results to include only those job postings where the job title is 'Data Scientist', the job is remote (job_work_from_home = TRUE), and the salary_year_avg is not null (indicating that a salary has been specified).
4. ORDER BY Clause: This sorts the results in descending order based on the average yearly salary (salary_year_avg), ensuring that the highest-paying jobs appear first.
5. LIMIT Clause: This restricts the output to the top 10 results, providing a concise list of the highest-paying remote Data Scientist roles.
6. JOIN Clause: The LEFT JOIN operation combines the job_postings_fact table with the company_dim table based on the company_id, allowing access to the company name associated with each job posting.
P.s: The query is designed to provide insights into the top-paying remote Data Scientist positions, highlighting employment trends and opportunities in the field.
Tip: Run query one by one to ensure that each part is functioning correctly and returning the expected results.
*/


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

/*
[
  {
    "Job ID": 1131472,
    "Job Title": "Data Scientist",
    "Location": "Anywhere",
    "Schedule Type": "Full-time",
    "Average Salary (Yearly)": "375000.0",
    "Posted Date": "2023-07-31 14:05:21",
    "Company Name": "Algo Capital Group"
  },
  {
    "Job ID": 158782,
    "Job Title": "Data Scientist",
    "Location": "Anywhere",
    "Schedule Type": "Full-time",
    "Average Salary (Yearly)": "275000.0",
    "Posted Date": "2023-07-04 10:41:31",
    "Company Name": "Algo Capital Group"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Location": "Anywhere",
    "Schedule Type": "Full-time",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates"
  },
  {
    "Job ID": 1538418,
    "Job Title": "Data Scientist",
    "Location": "Anywhere",
    "Schedule Type": "Full-time",
    "Average Salary (Yearly)": "204500.0",
    "Posted Date": "2023-01-23 01:04:11",
    "Company Name": "Grammarly"
  },
  {
    "Job ID": 727817,
    "Job Title": "Data Scientist",
    "Location": "Anywhere",
    "Schedule Type": "Full-time",
    "Average Salary (Yearly)": "197500.0",
    "Posted Date": "2023-11-01 23:02:27",
    "Company Name": "Cisco"
  },
  {
    "Job ID": 448423,
    "Job Title": "Data Scientist",
    "Location": "Anywhere",
    "Schedule Type": "Full-time",
    "Average Salary (Yearly)": "195000.0",
    "Posted Date": "2023-06-28 16:01:32",
    "Company Name": "Storm2"
  },
  {
    "Job ID": 1693772,
    "Job Title": "Data Scientist",
    "Location": "Anywhere",
    "Schedule Type": "Full-time",
    "Average Salary (Yearly)": "190600.0",
    "Posted Date": "2023-01-22 00:07:05",
    "Company Name": "Tomorrow.io"
  },
  {
    "Job ID": 37309,
    "Job Title": "Data Scientist",
    "Location": "Anywhere",
    "Schedule Type": "Full-time",
    "Average Salary (Yearly)": "186000.0",
    "Posted Date": "2023-01-10 12:20:43",
    "Company Name": "Grammarly"
  },
  {
    "Job ID": 910502,
    "Job Title": "Data Scientist",
    "Location": "Anywhere",
    "Schedule Type": "Full-time",
    "Average Salary (Yearly)": "185000.0",
    "Posted Date": "2023-11-14 15:02:53",
    "Company Name": "Brookwood Search & Selection"
  },
  {
    "Job ID": 64405,
    "Job Title": "Data Scientist",
    "Location": "Anywhere",
    "Schedule Type": "Full-time",
    "Average Salary (Yearly)": "185000.0",
    "Posted Date": "2023-09-21 17:28:44",
    "Company Name": "Mineral.ai"
  }
]
*/
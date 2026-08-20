/*
Question: What skills are required for the top-paying Data Scientist jobs?
- Use the top 10 highest-paying Data Scientist roles that are available remotely to identify the most frequently mentioned skills.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demand specific skills,
    helping job seekers understand which skills to develop that align with top salaries.
*/


WITH top_paying_jobs AS (
    SELECT
        job_id AS "Job ID",
        job_title AS "Job Title",
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
    LIMIT 10
) 

SELECT 
    top_paying_jobs.*,
    skills AS "Required Skills"
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs."Job ID" = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id;

/*
Step-by-step explanation:
1. CTE (top_paying_jobs): The query first creates a Common Table Expression (CTE) to identify the top 10 highest-paying remote Data Scientist positions with available salary information.
2. SELECT Clause (CTE): This retrieves the job ID, job title, average yearly salary, posted date, and company name for each job posting.
3. FROM Clause: The analysis starts from job_postings_fact, which contains the main job posting information.
4. LEFT JOIN Clause: job_postings_fact is joined with company_dim using company_id. A LEFT JOIN is used so that job postings are still included even if matching company information is unavailable.
5. WHERE Clause: The query filters the data to include only Data Scientist positions that are remote (job_work_from_home = TRUE) and have a specified yearly salary.
6. ORDER BY Clause: The results are sorted by salary_year_avg in descending order, placing the highest-paying positions at the top.
7. LIMIT Clause: The query limits the results to the top 10 highest-paying Data Scientist positions.
8. Final SELECT Clause: The outer query retrieves all information from the top_paying_jobs CTE and adds the required skills associated with each position.
9. INNER JOIN Clause (skills_job_dim): The top-paying jobs are joined with skills_job_dim using job_id to connect each job posting with its associated skills.
10. INNER JOIN Clause (skills_dim): The result is then joined with skills_dim using skill_id to retrieve the actual names of the required skills.
P.s: The query is designed to identify the skills required for the top 10 highest-paying remote Data Scientist positions, helping reveal which technical skills are commonly associated with high-paying opportunities.
Tip: The CTE makes the query easier to understand by separating the process of finding the top-paying jobs from the process of identifying the skills required for those jobs.
*/
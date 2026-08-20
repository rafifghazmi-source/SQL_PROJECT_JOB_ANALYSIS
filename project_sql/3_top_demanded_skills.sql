/*
Question: What are the most in-demand skills for data science jobs?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for Data Scientist roles 
- Focus on all job postings
- Why? Retrieves the top 5 skills with the highest demand in job maket,
    providing insights into the most valueable for the job seeker.
*/


SELECT
    skills_dim.skills AS "Skill",
    COUNT(skills_job_dim.job_id) AS "Demand Count"
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title ='Data Scientist' 
    AND job_work_from_home = 'True'
GROUP BY 
    skills_dim.skills
ORDER BY
    "Demand Count" DESC
LIMIT 5;

/*
Step by step explanation:
1. SELECT Clause: This part of the query specifies the columns to be retrieved from the database. Its includes skills_dim.skills (the name of the skill) and COUNT(skills_job_dim.job_id) (the count of job postings that require that skill).
2. FROM Clause: This indicates the primary table from which to retrieve the data, which is  job_postings_fact.
3. INNER JOIN Clause: This combines the job_postings_fact table with the skills_job_dim table based on the job_id, and then combines the result with the skills_dim table based on the skill_id. This allows access to the skill names associated with each job posting.
4. WHERE Clause: This filters the results to include only those job postings where the job title is 'Data Scientist' and the job is remote (job_work_from_home = 'True').
5. GROUP BY Clause: This groups the results by skill name, allowing the COUNT function to calculate the number of job postings for each skill.
6. ORDER BY Clause: This sorts the results in descending order based on the demand count, ensuring that the most in-demand skills appear first.
7. LIMIT Clause: This restricts the output to the top 5 results, providing a concise list of the most in-demand skills for Data Scientist roles.
P.s: The query is designed to provide insights into the most in-demand skills for remote Data Scientist positions, highlighting employment trends and opportunities in the field.
Tip: Run query one by one to ensure that each part is functioning correctly and returning the expected results.
*/
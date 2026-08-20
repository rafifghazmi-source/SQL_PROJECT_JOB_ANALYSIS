/*
Answer: What are the top-paying skills based on salary?
- Look at the average salary for each skill and identify the top 5 highest-paying skills for Data Scientist roles.
- Focuses on roles  with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Scientist and
    helps identify the most financially rewarding skills to acquire or improve.
*/


SELECT
    skills_dim.skills AS "Skill",
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS "Average Salary (Yearly)"
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title ='Data Scientist' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = 'True'
GROUP BY 
    skills_dim.skills
ORDER BY
    "Average Salary (Yearly)" DESC
LIMIT 25;

/*
Step by step explanation:
1. SELECT Clause: This specifies the columns to be retrieved. It includes skills_dim.skills (the skill name) and ROUND(AVG(job_postings_fact.salary_year_avg), 0), which calculates the average yearly salary associated with each skill and rounds the result to the nearest whole number.
2. FROM Clause: This indicates that job_postings_fact is the primary table used for the analysis.
3. INNER JOIN Clause: The job_postings_fact table is joined with skills_job_dim using job_id, and then skills_job_dim is joined with skills_dim using skill_id. These joins connect each job posting with the skills required for that position.
4. WHERE Clause: This filters the data to include only Data Scientist positions where the yearly salary is available (salary_year_avg IS NOT NULL) and the position is remote (job_work_from_home = 'True').
5. GROUP BY Clause: This groups the results by skill name, allowing the AVG() function to calculate the average salary for each individual skill.
6. ORDER BY Clause: This sorts the results in descending order based on the calculated average yearly salary, placing the highest-paying skills at the top.
7. LIMIT Clause: This restricts the output to the top 25 skills with the highest average yearly salaries, making it easier to identify the highest-paying skills in the dataset.
P.s: The query is designed to identify which skills are associated with the highest average salaries among remote Data Scientist positions, providing insights into the potential financial value of different technical skills.
Tip: Run the query step by step and inspect the results after each clause to better understand how filtering, joining, grouping, and aggregation affect the final output.
*/
/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and assosciated with high average salaries for Data Scientists roles
- Concentrates on remote positions with specified salaries
- Why? Target skills that offer job security (high-demand) and financial benefits (high salaries),
    offering strategic insights for career development in Data Science.
*/


WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS "Demand Count"
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_postings_fact.job_title ='Data Scientist' 
        AND job_work_from_home = 'True' 
        AND salary_year_avg IS NOT NULL
    GROUP BY 
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg),0) AS "Average Salary (Yearly)"
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_postings_fact.job_title ='Data Scientist' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = 'True'
    GROUP BY 
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills AS "Skill",
    skills_demand."Demand Count",
    average_salary."Average Salary (Yearly)"
FROM 
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    skills_demand."Demand Count" > 10
ORDER BY
    skills_demand."Demand Count" DESC,
    average_salary."Average Salary (Yearly)" DESC
LIMIT 25;

/*
Step-by-step explanation — Query 1:
1. CTE (skills_demand): The first CTE calculates the demand for each skill by counting how many remote Data Scientist job postings require that skill. It filters the data to include only positions with specified salaries.
2. SELECT Clause (skills_demand): This retrieves the skill_id, skill name, and "Demand Count" calculated using COUNT().
3. CTE (average_salary): The second CTE calculates the average yearly salary associated with each skill using AVG(), and rounds the result to the nearest whole number.
4. FROM & INNER JOIN Clauses: Both CTEs connect job_postings_fact with skills_job_dim using job_id and skills_job_dim with skills_dim using skill_id. This allows the query to connect job postings with their required skills.
5. WHERE Clause: Both CTEs filter the dataset to include only Data Scientist positions that are remote and have a specified yearly salary.
6. GROUP BY Clause: Each CTE groups the results by skill_id so that demand and average salary can be calculated for each individual skill.
7. Final INNER JOIN: The skills_demand and average_salary CTEs are joined using skill_id, combining the demand and salary information for each skill.
8. WHERE Clause (Final Query): The results are filtered to include only skills that appear in more than 10 job postings. This removes skills with very low demand from the analysis.
9. ORDER BY Clause: The results are first sorted by Demand Count in descending order, followed by Average Salary in descending order when two skills have the same demand.
10. LIMIT Clause: The query returns the top 25 skills that meet the demand threshold.
P.s: This query is designed to identify skills that combine strong demand with competitive salaries, helping determine which skills may be the most valuable to learn for a Data Scientist career.
Tip: CTEs make complex queries easier to understand by breaking the analysis into smaller, independent steps.
*/


-- rewriting this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills AS "Skills",
    COUNT(skills_job_dim.job_id) AS "Demand Count",
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS "Average Salary"
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id
ORDER BY
    "Average Salary" DESC,
    "Demand Count" DESC
LIMIT 25;

/*
Step-by-step explanation — Query 2:
1. SELECT Clause: This retrieves the skill_id, skill name, Demand Count, and Average Salary. COUNT() measures how frequently each skill appears in job postings, while AVG() calculates the average yearly salary associated with each skill.
2. FROM Clause: The analysis starts from job_postings_fact, which contains the Data Scientist job posting information.
3. INNER JOIN Clause: job_postings_fact is joined with skills_job_dim using job_id, and then skills_job_dim is joined with skills_dim using skill_id. This connects each job posting to the skills required for that position.
4. WHERE Clause: The data is filtered to include only Data Scientist positions, remote jobs, and postings with a specified yearly salary.
5. GROUP BY Clause: The results are grouped by skill_id so that COUNT() and AVG() can calculate demand and average salary for each skill.
6. ORDER BY Clause: The results are sorted by Average Salary in descending order. If two skills have the same salary, Demand Count is used as the secondary sorting criteria.
7. LIMIT Clause: The query returns the top 25 skills based on the selected ordering.
P.s: This version provides a more concise approach to the same analysis by calculating skill demand and average salary in a single query instead of using multiple CTEs.
Tip: When multiple CTEs perform calculations on the same filtered dataset, check whether the analysis can be simplified into a single GROUP BY query.
*/

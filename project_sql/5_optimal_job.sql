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
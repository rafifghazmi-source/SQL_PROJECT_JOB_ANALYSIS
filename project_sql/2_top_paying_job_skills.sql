/*
Question: What skills are required for the top-paying Data Scientist jobs?
- Use the top 10 highest-paying Data Scientist roles that are available remotely to identify the most frequently mentioned skills.
- Add the specific skills required for these roles
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
Key Insights

1. Python is the dominant skill
Python appears in 100% of the job postings, making it the most consistently demanded skill.

2. SQL is the second most important skill
SQL appears in 80% of postings, showing that database querying and data manipulation are highly relevant for Data Scientist roles.

3. There is a significant drop after Python and SQL
The next most frequent skills—AWS, R, Spark, and Tableau—appear in only 30% of postings. This suggests Python and SQL form the core skill set, while other technologies are more role-specific.

4. Specialized technologies have lower frequency
Java, Cassandra, Hadoop, and Scala appear in only 20% of postings. These skills may be valuable for specific industries or technical environments but are not universally required.

Main Takeaway:
Python and SQL are the strongest foundational skills among the analyzed high-paying Data Scientist jobs. 
Python is universally required, while SQL is required by 4 out of 5 postings. Other technologies appear 
much less frequently and can therefore be treated as specialization skills.
*/



/*
[
  {
    "Job ID": 1131472,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "375000.0",
    "Posted Date": "2023-07-31 14:05:21",
    "Company Name": "Algo Capital Group",
    "Required Skills": "sql"
  },
  {
    "Job ID": 1131472,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "375000.0",
    "Posted Date": "2023-07-31 14:05:21",
    "Company Name": "Algo Capital Group",
    "Required Skills": "python"
  },
  {
    "Job ID": 1131472,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "375000.0",
    "Posted Date": "2023-07-31 14:05:21",
    "Company Name": "Algo Capital Group",
    "Required Skills": "java"
  },
  {
    "Job ID": 1131472,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "375000.0",
    "Posted Date": "2023-07-31 14:05:21",
    "Company Name": "Algo Capital Group",
    "Required Skills": "cassandra"
  },
  {
    "Job ID": 1131472,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "375000.0",
    "Posted Date": "2023-07-31 14:05:21",
    "Company Name": "Algo Capital Group",
    "Required Skills": "spark"
  },
  {
    "Job ID": 1131472,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "375000.0",
    "Posted Date": "2023-07-31 14:05:21",
    "Company Name": "Algo Capital Group",
    "Required Skills": "hadoop"
  },
  {
    "Job ID": 1131472,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "375000.0",
    "Posted Date": "2023-07-31 14:05:21",
    "Company Name": "Algo Capital Group",
    "Required Skills": "tableau"
  },
  {
    "Job ID": 158782,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "275000.0",
    "Posted Date": "2023-07-04 10:41:31",
    "Company Name": "Algo Capital Group",
    "Required Skills": "sql"
  },
  {
    "Job ID": 158782,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "275000.0",
    "Posted Date": "2023-07-04 10:41:31",
    "Company Name": "Algo Capital Group",
    "Required Skills": "python"
  },
  {
    "Job ID": 158782,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "275000.0",
    "Posted Date": "2023-07-04 10:41:31",
    "Company Name": "Algo Capital Group",
    "Required Skills": "java"
  },
  {
    "Job ID": 158782,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "275000.0",
    "Posted Date": "2023-07-04 10:41:31",
    "Company Name": "Algo Capital Group",
    "Required Skills": "cassandra"
  },
  {
    "Job ID": 158782,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "275000.0",
    "Posted Date": "2023-07-04 10:41:31",
    "Company Name": "Algo Capital Group",
    "Required Skills": "aws"
  },
  {
    "Job ID": 158782,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "275000.0",
    "Posted Date": "2023-07-04 10:41:31",
    "Company Name": "Algo Capital Group",
    "Required Skills": "spark"
  },
  {
    "Job ID": 158782,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "275000.0",
    "Posted Date": "2023-07-04 10:41:31",
    "Company Name": "Algo Capital Group",
    "Required Skills": "airflow"
  },
  {
    "Job ID": 158782,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "275000.0",
    "Posted Date": "2023-07-04 10:41:31",
    "Company Name": "Algo Capital Group",
    "Required Skills": "hadoop"
  },
  {
    "Job ID": 158782,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "275000.0",
    "Posted Date": "2023-07-04 10:41:31",
    "Company Name": "Algo Capital Group",
    "Required Skills": "tableau"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "sql"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "python"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "javascript"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "html"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "mongodb"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "vba"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "php"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "mongodb"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "aws"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "tensorflow"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "scikit-learn"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "excel"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "tableau"
  },
  {
    "Job ID": 1489914,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "250000.0",
    "Posted Date": "2023-10-04 16:03:51",
    "Company Name": "Smith Hanley Associates",
    "Required Skills": "powerpoint"
  },
  {
    "Job ID": 1538418,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "204500.0",
    "Posted Date": "2023-01-23 01:04:11",
    "Company Name": "Grammarly",
    "Required Skills": "sql"
  },
  {
    "Job ID": 1538418,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "204500.0",
    "Posted Date": "2023-01-23 01:04:11",
    "Company Name": "Grammarly",
    "Required Skills": "python"
  },
  {
    "Job ID": 1538418,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "204500.0",
    "Posted Date": "2023-01-23 01:04:11",
    "Company Name": "Grammarly",
    "Required Skills": "scala"
  },
  {
    "Job ID": 1538418,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "204500.0",
    "Posted Date": "2023-01-23 01:04:11",
    "Company Name": "Grammarly",
    "Required Skills": "r"
  },
  {
    "Job ID": 727817,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "197500.0",
    "Posted Date": "2023-11-01 23:02:27",
    "Company Name": "Cisco",
    "Required Skills": "sql"
  },
  {
    "Job ID": 727817,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "197500.0",
    "Posted Date": "2023-11-01 23:02:27",
    "Company Name": "Cisco",
    "Required Skills": "python"
  },
  {
    "Job ID": 727817,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "197500.0",
    "Posted Date": "2023-11-01 23:02:27",
    "Company Name": "Cisco",
    "Required Skills": "r"
  },
  {
    "Job ID": 727817,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "197500.0",
    "Posted Date": "2023-11-01 23:02:27",
    "Company Name": "Cisco",
    "Required Skills": "snowflake"
  },
  {
    "Job ID": 727817,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "197500.0",
    "Posted Date": "2023-11-01 23:02:27",
    "Company Name": "Cisco",
    "Required Skills": "sheets"
  },
  {
    "Job ID": 448423,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "195000.0",
    "Posted Date": "2023-06-28 16:01:32",
    "Company Name": "Storm2",
    "Required Skills": "python"
  },
  {
    "Job ID": 1693772,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "190600.0",
    "Posted Date": "2023-01-22 00:07:05",
    "Company Name": "Tomorrow.io",
    "Required Skills": "python"
  },
  {
    "Job ID": 1693772,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "190600.0",
    "Posted Date": "2023-01-22 00:07:05",
    "Company Name": "Tomorrow.io",
    "Required Skills": "aws"
  },
  {
    "Job ID": 37309,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "186000.0",
    "Posted Date": "2023-01-10 12:20:43",
    "Company Name": "Grammarly",
    "Required Skills": "sql"
  },
  {
    "Job ID": 37309,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "186000.0",
    "Posted Date": "2023-01-10 12:20:43",
    "Company Name": "Grammarly",
    "Required Skills": "python"
  },
  {
    "Job ID": 37309,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "186000.0",
    "Posted Date": "2023-01-10 12:20:43",
    "Company Name": "Grammarly",
    "Required Skills": "scala"
  },
  {
    "Job ID": 37309,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "186000.0",
    "Posted Date": "2023-01-10 12:20:43",
    "Company Name": "Grammarly",
    "Required Skills": "r"
  },
  {
    "Job ID": 910502,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "185000.0",
    "Posted Date": "2023-11-14 15:02:53",
    "Company Name": "Brookwood Search & Selection",
    "Required Skills": "sql"
  },
  {
    "Job ID": 910502,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "185000.0",
    "Posted Date": "2023-11-14 15:02:53",
    "Company Name": "Brookwood Search & Selection",
    "Required Skills": "python"
  },
  {
    "Job ID": 64405,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "185000.0",
    "Posted Date": "2023-09-21 17:28:44",
    "Company Name": "Mineral.ai",
    "Required Skills": "sql"
  },
  {
    "Job ID": 64405,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "185000.0",
    "Posted Date": "2023-09-21 17:28:44",
    "Company Name": "Mineral.ai",
    "Required Skills": "python"
  },
  {
    "Job ID": 64405,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "185000.0",
    "Posted Date": "2023-09-21 17:28:44",
    "Company Name": "Mineral.ai",
    "Required Skills": "databricks"
  },
  {
    "Job ID": 64405,
    "Job Title": "Data Scientist",
    "Average Salary (Yearly)": "185000.0",
    "Posted Date": "2023-09-21 17:28:44",
    "Company Name": "Mineral.ai",
    "Required Skills": "spark"
  }
]
*/


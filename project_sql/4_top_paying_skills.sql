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
Top-Paying Skills  Key Insights:
- High salaries are concentrated in specialized skills. PHP and HTML rank highest at around $183K/year, followed by Crystal (~$183K), Neo4j (~$177K), and 
    Cassandra (~$174K). This suggests that niche technical expertise can command a premium.
- Data infrastructure and modern development skills are highly valued. Skills such as Cassandra, Neo4j, MongoDB, Aurora, FastAPI, and 
    PySpark appear among the top-paying skills, indicating strong compensation potential for expertise in databases, backend systems, and large-scale data processing.
- The highest-paying skills are not necessarily the most common skills. Skills like Scala, PySpark, JavaScript, and
    VBA offer high average salaries but may not be as frequently demanded. Therefore, skill frequency and salary potential represent different dimensions when deciding which skills to develop.
*/


/*
[
  {
    "Skill": "php",
    "Average Salary (Yearly)": "183333"
  },
  {
    "Skill": "html",
    "Average Salary (Yearly)": "183333"
  },
  {
    "Skill": "crystal",
    "Average Salary (Yearly)": "183310"
  },
  {
    "Skill": "neo4j",
    "Average Salary (Yearly)": "177207"
  },
  {
    "Skill": "cassandra",
    "Average Salary (Yearly)": "173714"
  },
  {
    "Skill": "powerpoint",
    "Average Salary (Yearly)": "171500"
  },
  {
    "Skill": "sap",
    "Average Salary (Yearly)": "161780"
  },
  {
    "Skill": "julia",
    "Average Salary (Yearly)": "157500"
  },
  {
    "Skill": "node.js",
    "Average Salary (Yearly)": "156107"
  },
  {
    "Skill": "vue",
    "Average Salary (Yearly)": "156107"
  },
  {
    "Skill": "aurora",
    "Average Salary (Yearly)": "155000"
  },
  {
    "Skill": "ruby",
    "Average Salary (Yearly)": "154500"
  },
  {
    "Skill": "mongodb",
    "Average Salary (Yearly)": "151708"
  },
  {
    "Skill": "jira",
    "Average Salary (Yearly)": "150324"
  },
  {
    "Skill": "hugging face",
    "Average Salary (Yearly)": "150000"
  },
  {
    "Skill": "fastapi",
    "Average Salary (Yearly)": "148000"
  },
  {
    "Skill": "vba",
    "Average Salary (Yearly)": "146876"
  },
  {
    "Skill": "c",
    "Average Salary (Yearly)": "146471"
  },
  {
    "Skill": "datarobot",
    "Average Salary (Yearly)": "145833"
  },
  {
    "Skill": "javascript",
    "Average Salary (Yearly)": "145417"
  },
  {
    "Skill": "powershell",
    "Average Salary (Yearly)": "145000"
  },
  {
    "Skill": "visual basic",
    "Average Salary (Yearly)": "145000"
  },
  {
    "Skill": "scala",
    "Average Salary (Yearly)": "144576"
  },
  {
    "Skill": "plotly",
    "Average Salary (Yearly)": "143750"
  },
  {
    "Skill": "pyspark",
    "Average Salary (Yearly)": "142905"
  }
]

*/
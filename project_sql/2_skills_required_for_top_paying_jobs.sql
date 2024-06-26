With skills_and_id AS (
    SELECT *
    FROM 
    skills_job_dim
    INNER JOIN skills_dim ON   
    skills_job_dim.skill_id = skills_dim.skill_id
)
SELECT
    job_postings_fact.job_id,
    salary_year_avg,
    job_title,
    job_location,
    job_schedule_type,
    company_dim.name AS company_name,
    skills_and_id.skills
FROM job_postings_fact
LEFT JOIN company_dim ON
    job_postings_fact.company_id = company_dim.company_id
INNER JOIN skills_and_id ON
    job_postings_fact.job_id = skills_and_id.job_id  --makeing sure all jobs associate wtih a skill
WHERE 
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10

/*
The top 10 most common skills in the dataset for top-paying jobs in 2023 are:

SQL: 398 occurrences
Excel: 256 occurrences
Python: 236 occurrences
Tableau: 230 occurrences
R: 148 occurrences
SAS: 126 occurrences
Power BI: 110 occurrences
PowerPoint: 58 occurrences
Looker: 49 occurrences
Word: 48 occurrences
*/

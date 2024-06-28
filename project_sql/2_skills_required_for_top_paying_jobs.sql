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
    job_postings_fact.job_id = skills_and_id.job_id  --making sure all jobs are associated with a skill
WHERE 
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10

/*
the above does not work because jobs count limits result to 10, but 1 job can have multiple skills
*/


WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT  
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

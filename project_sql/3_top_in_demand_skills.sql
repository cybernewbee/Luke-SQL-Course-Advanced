--What are the most in-demand skills as a data analyst
SELECT 
    skills_job_dim.skill_id,
    COUNT (skills_job_dim.skill_id) AS skill_count,
    skills
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON 
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skills_job_dim.skill_id, skills 
ORDER BY
    skill_count DESC
LIMIT 15


--prompts: top 5 skills by remote jobs; need skill names, counts, and skill id
--my result;
WITH table_w_skills_id AS (
    SELECT
    job_postings_fact.job_id,
    skills_job_dim.skill_id,
    CASE 
        WHEN job_location = 'Anywhere'  THEN 'Remote'    
        ELSE 'Onsite'  
    END AS location_category  
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
)

SELECT 
    skills,
    table_w_skills_id.skill_id,
    COUNT (table_w_skills_id.job_id) AS job_count, --count later
    location_category 
FROM table_w_skills_id
INNER JOIN skills_dim ON
    table_w_skills_id.skill_id = skills_dim.skill_id
WHERE
    location_category = 'Remote'
GROUP BY
    skills, 
    location_category,
    table_w_skills_id.skill_id
ORDER BY
    job_count DESC
LIMIT 5;

--Luke's result;
WITH remote_job_skills AS (
SELECT 
    skill_id,
    COUNT (*) AS skill_count --count first
FROM 
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings ON 
    job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = true AND
    job_postings.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)

SELECT 
    skills_dim.skill_id,
    skills,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim ON 
    remote_job_skills.skill_id = skills_dim.skill_id
ORDER BY skill_count DESC
LIMIT 5;

--my result after optimazation;
WITH table_w_skills_id AS (
    SELECT 
        skill_id,
        COUNT (*) AS skill_count,
    CASE 
        WHEN job_location = 'Anywhere'  THEN 'Remote'    
        ELSE 'Onsite'  
    END AS location_category  
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skill_id, location_category 
)

SELECT 
    skills,
    table_w_skills_id.skill_id,
    skill_count
FROM table_w_skills_id
INNER JOIN skills_dim ON
    table_w_skills_id.skill_id = skills_dim.skill_id
WHERE
    location_category = 'Remote'
ORDER BY
    skill_count DESC
LIMIT 5;

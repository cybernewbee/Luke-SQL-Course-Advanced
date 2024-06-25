-- combine two queries into one in 3_case.sql using () AS...;
SELECT * 
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;

-- CTE starts with the "WITH...AS()" ;

WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)
SELECT *
FROM january_jobs;

--same function with a reverse order;
--more powerful usage using "WHERE...IN()";

SELECT company_id,
       name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
)
ORDER BY company_id ASC

SELECT *
FROM company_dim


--practice problem;
WITH company_job_count AS (    
    SELECT
    company_id,
    COUNT (*) AS job_count 
FROM 
    job_postings_fact
GROUP BY
    company_id
)
SELECT
    company_dim.company_id,
    name,
    job_count
FROM company_dim
LEFT JOIN company_job_count ON
    company_dim.company_id = company_job_count.company_id
ORDER BY
    job_count DESC
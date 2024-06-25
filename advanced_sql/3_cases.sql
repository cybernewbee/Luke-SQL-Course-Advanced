-- January
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

--Februay
CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

--March
CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT *
FROM january_jobs

SELECT *
FROM february_jobs


-- it does not neccessarily creat a new column



SELECT
    job_title_short,
    job_location,    -- need a comma here
    CASE 
        WHEN job_location = 'Anywhere'  THEN 'Remote'    -- if 1
        WHEN job_location = 'New York, NY' THEN 'Local'  -- if 2
        ELSE 'Onsite'  -- else
    END AS location_category  -- a new column
FROM job_postings_fact;

-- aggregate the above
SELECT
    COUNT (job_id) AS number_of_jobs,
    CASE 
        WHEN job_location = 'Anywhere'  THEN 'Remote'    -- if 1
        WHEN job_location = 'New York, NY' THEN 'Local'  -- if 2
        ELSE 'Onsite'  -- else
    END AS location_category  -- a new column
FROM job_postings_fact
Where job_title_short = 'Data Analyst'
GROUP BY
    location_category;
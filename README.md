## Introduction
💁 Raw data was provided by Luke Barousse from his SQL course on his YouTube channel. The data set was built by collecting
data from job posting websites. The data set consists of job titles, salary, location, required skills, etc. Original data can be found [here](https://www.lukebarousse.com/sql). <br/>
❓SQL queries can be found in [my project SQL folder](https://github.com/cybernewbee/Luke-SQL-Course-Advanced/tree/master/project_sql). 
## Background
This analysis tried to pinpoint 💰top-paying jobs and associated skills. The actual questions I wanted to answer are the following: <br/>
1. What are the top-paying data analyst jobs? 
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?
## Tools I Used
- **SQL**: The most essential part of this analysis. All queries are made using SQL.
- **PostgreSQL**: the database management system.
- **Visual Studio Code**: A powerful coding tool
- **Github**: Storaging, tracking, and showcasing queries and results
## The Analysis
The questions mentioned above were translated into queries. The following are my approaches.
### 1. What are the top-paying data analyst jobs? 
Ordering data entries by salaries. Joining company name table since company name is not in the same table.
```

SELECT
    job_id,
    salary_year_avg,
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date,
    company_dim.name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON
    job_postings_fact.company_id = company_dim.company_id
WHERE 
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10
```
## 2. What skills are required for these top-paying jobs?
Based on question 1, join the skill table to obtain skill names.
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?
## What I learned
## Conclusions 

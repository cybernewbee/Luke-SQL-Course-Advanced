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
- **Tableau**: A data visualization tool.
- **Github**: Storaging, tracking, and showcasing queries and results
## The Analysis
The questions mentioned above were translated into queries. The following are my approaches.
### 1. What are the top-paying data analyst jobs? 
Ordering data entries by salaries. Joining company name table since company name is not in the same table.
Here is a chart of the results:
![Screen Shot 2024-06-28 at 2 01 39 PM](https://github.com/cybernewbee/Luke-SQL-Course-Advanced/assets/121833641/917de84b-16c3-40b4-b902-74593aef2328)
- **Wide Salary Range**: annual salaries range from $184,000 to $650,000 showing the potential of this field.
- **Various Employers**: the result shows companies hiring data analysts from different industries, such as Meta, AT&T, Smartasset, etc.
- **Various Positions**: opening positions also vary from data analyst to director of analytics.
### 2. What skills are required for these top-paying jobs?
Based on question 1, join the skill table to obtain skill names.
![Screen Shot 2024-06-28 at 2 06 12 PM](https://github.com/cybernewbee/Luke-SQL-Course-Advanced/assets/121833641/e6b7e904-7ada-4aab-8d21-25bbda89a518)
-the result shows SQL, Python, Excel, and R are among the most wanted skills.
###3. What skills are most in demand for data analysts?
A skill count for all data analyst job postings was performed. The result is similar to question 2. 
![Screen Shot 2024-06-28 at 2 23 09 PM](https://github.com/cybernewbee/Luke-SQL-Course-Advanced/assets/121833641/1183b133-b4d9-45db-a8c5-712e3a60821f)
###4. Which skills are associated with higher salaries?
###5. What are the most optimal skills to learn?
## What I learned
## Conclusions 

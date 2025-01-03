/* GOAL
1. You are an aspiring data nerd looking to analyze the top-paying roles and skills
2. You will create SQL queries to explore this large dataset specific to you
For those job searching or looking for a promotion; you can not only use this project to showcase experience BUT also to extract what roles/skills you should target.

Question: What are the top=paying data analyst jobs?
- Identify the top 10 highest paying data analyst roles that are available remotely.
- Focuses on job postings with specified salaries (removes nulls).
- Why? highlight the top paying opportunites for data analysts, offering insights into finding the most optimal roles and skills as a Data Analyst.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    (job_location LIKE 'Anywhere' OR job_location LIKE '%, CA') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 50;


SELECT
    job_location
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
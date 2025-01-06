/* What are the most in-demand skills for data analysts remotely and in CA? */


WITH remote_job_skills AS (
    SELECT 
        skill_id,
        COUNT (*) AS skills_count --add count
    FROM skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON skills_to_job.job_id = job_postings.job_id
    WHERE job_title_short = 'Data Analyst' AND 
    (job_location LIKE 'Anywhere' OR job_location LIKE '%, CA') AND
    salary_year_avg IS NOT NULL
    GROUP BY skill_id
)

SELECT  
    skills.skill_id,
    skills AS skill_name,
    skills_count
FROM remote_job_skills
INNER JOIN skills_dim as skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY 
    skills_count DESC
LIMIT 5;
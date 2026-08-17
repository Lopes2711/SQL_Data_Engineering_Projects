/*
Question: What are the best skills for data engineers - balancing both demand and salary?
Create a ranking column that combines demand count and median salary to identify the most valuable skills
Focus only on remote Data Engineer positions with specified annual salaries 
*/

SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) as median_salary,
    COUNT(jpf.salary_year_avg) AS demanded_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim as sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer' AND jpf.job_work_from_home = TRUE 
GROUP BY 
    sd.skills
HAVING 
    COUNT(jpf.*) > 100
ORDER BY
    median_salary DESC
LIMIT 25;
/*
Question: What are the top demanded skills for data engineers?
-Identify the top 10 in-demanded skills for data engineers
- Focus on remote job postings and presencial/hybrid job postings in Portugal 

*/

SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim as sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer' AND jpf.job_work_from_home = TRUE 
GROUP BY 
    sd.skills
ORDER BY
    demand_count DESC
LIMIT 10;

/*
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
*/

SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim as sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer' AND jpf.job_location = 'Portugal'
GROUP BY 
    sd.skills
ORDER BY
    demand_count DESC
LIMIT 10;

/*
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │          382 │
│ python     │          371 │
│ azure      │          283 │
│ spark      │          229 │
│ aws        │          216 │
│ databricks │          132 │
│ git        │          114 │
│ nosql      │          110 │
│ pyspark    │          109 │
│ go         │          104 │
└────────────┴──────────────┘
*/


/*
Conclusion:
- SQL and Python are the most in-demand skills in both markets.
- Remote jobs emphasize AWS, Airflow, and Snowflake, while the Portuguese
  market emphasizes Azure, Git, and PySpark.
*/

   
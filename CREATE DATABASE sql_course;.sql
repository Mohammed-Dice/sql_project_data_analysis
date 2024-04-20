--CREATE DATABASE sql_course;


-- SELECT 
--     COUNT(job_id),
--     EXTRACT(MONTH FROM job_posted_date) AS month
-- FROM 
--     job_postings_fact
-- WHERE
--     job_title_short = 'Data Analyst'
-- GROUP BY
--     month ;

-- January
-- CREATE TABLE january_jobs AS
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH from job_posted_date) = 1;

-- February
-- CREATE TABLE february_jobs AS
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH from job_posted_date) = 2;

-- March
-- CREATE TABLE march_jobs AS
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH from job_posted_date) = 3;

-- and so on, until December
-- SELECT 

--     job_title_short,
--     job_location,
--     CASE 
--         WHEN job_location = 'Anywhere' THEN 'Remote'
--         WHEN job_location = 'New York, NY' THEN 'local'
--         ELSE 'Onsite'
--     END AS location_category
-- FROM job_postings_fact

--CASE statement
-- SELECT 
--     COUNT(job_id) AS number_of_jobs,
--     CASE 
--         WHEN job_location = 'Anywhere' THEN 'Remote'
--         WHEN job_location = 'New York, NY' THEN 'local'
--         ELSE 'Onsite'
--     END AS location_category
-- FROM job_postings_fact
-- WHERE 
--     job_title_short = 'Data Analyst'
-- GROUP BY
--     location_category
-- ORDER BY
--     number_of_jobs 


-- SELECT *
-- FROM(
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH from job_posted_date) = 1
-- ) AS january_jobs

-- --CTE
-- WITH january_jobs AS(
--     SELECT *
--     FROM job_postings_fact
--      WHERE EXTRACT(MONTH from job_posted_date) = 1 
-- )

-- SELECT *
-- FROM january_jobs

-- SELECT 
--     company_id,
--     name AS company_name
-- FROM company_dim
-- WHERE company_id IN (
--     SELECT 
--         company_id
--     FROM 
--         job_postings_fact
--     WHERE job_no_degree_mention = true
-- ) 

-- SELECT company_id
-- FROM job_postings_fact;

-- SELECT company_id
-- FROM company_dim;

-- WITH company_job_count AS (
--     SELECT 
--         company_id,
--         COUNT(*) AS total_jobs
--     FROM 
--         job_postings_fact
--     GROUP BY 
--         company_id
-- )

-- SELECT 
--     com1.name AS company_name,
--     com2.total_jobs
-- FROM company_dim AS com1
-- LEFT JOIN company_job_count AS com2
--  ON com1.company_id = com2.company_id
-- ORDER BY 
--     com2.total_jobs DESC

--project of Analysing for the most popular skill using as data Anaysis
--  WITH remote_job_skills AS(
--     SELECT
--         skill_id,
--         COUNT(*) AS skill_count
--     FROM skills_job_dim AS skills_to_job
--     INNER JOIN job_postings_fact AS job_posting ON job_posting.job_id = skills_to_job.job_id
--     WHERE 
--         job_posting.job_work_from_home = true AND job_posting.job_title_short = 'Data Analyst'
--     GROUP BY
--         skill_id
-- )

-- SELECT 
--     skills.skill_id,
--     skills AS skill_name,
--     skill_count
-- FROM remote_job_skills
-- INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
-- ORDER BY 
--     skill_count DESC
--     LIMIT 5;

-- SELECT 
--     job_title_short,
--     company_id,
--     job_location
-- FROM january_jobs

-- --UNION 
-- UNION ALL

-- SELECT 
--     job_title_short,
--     company_id,
--     job_location
-- FROM february_jobs

-- --UNION
-- UNION ALL

-- SELECT 
--     job_title_short,
--     company_id,
--     job_location
-- FROM march_jobs

WITH all_jobs AS(
    SELECT 
        job_id,
        job_posted_date::date,
        salary_year_avg,
        job_title_short
    
    FROM january_jobs
    WHERE
        EXTRACT(MONTH from job_posted_date) = 1 OR EXTRACT(MONTH from job_posted_date) = 1


    --UNION 
    UNION ALL

    SELECT 
        job_id,
        job_posted_date::date,
        salary_year_avg,
        job_title_short
    FROM february_jobs
    WHERE
        EXTRACT(MONTH from job_posted_date) = 1

    --UNION
    UNION ALL

    SELECT 
        job_id,
        job_posted_date::date,
        salary_year_avg,
        job_title_short
    FROM march_jobs
    WHERE
    EXTRACT(MONTH from job_posted_date) = 1
)


SELECT 
    COUNT(job_id) as job,
    job_title_short
from all_jobs
WHERE
    salary_year_avg > 70000
    AND job_title_short = 'Data Analyst'
GROUP BY
    job_title_short


-- Anaysis jobs for first Quater their salary over 70000

SELECT 
    job_location,
    job_via,
    job_posted_date::date,
    salary_year_avg
    FROM(
        SELECT *
        from january_jobs

        UNION All

        SELECT *
        from february_jobs

        UNION ALL

        SELECT *
        from march_jobs
    )AS quarter1_jobs_posted
WHERE 
    salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_hour_avg DESC



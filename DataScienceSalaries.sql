--- CREATING A TABLE ON SALARIES OF DATA SCIENCE

CREATE TABLE DataScienceSalaries (
	num INT,
	work_year VARCHAR,
	experience_level VARCHAR,
	employment_type VARCHAR,
	job_title VARCHAR,
	salary NUMERIC,
	salary_currency VARCHAR,
	salary_in_usd NUMERIC,
	employee_residence VARCHAR,
	remote_ratio NUMERIC,
	company_location VARCHAR,
	company_size VARCHAR
);

--- IMPORTING DATA FROM CSV FILE ds_salaries

COPY DataScienceSalaries FROM 'C:\Program Files\PostgreSQL\14\data\Data\ds_salaries.csv' csv header;

--- SHOWING FULL TABLE

SELECT * FROM DataScienceSalaries;

--- DELETE COLUMN num WHICH IS NOT NEEDED

ALTER TABLE DataScienceSalaries DROP COLUMN num;

--- FINDING THE MINIMUM AND MAXIMUM WORK YEAR IN THE TABLE

SELECT MIN(work_year) AS Minimum_year, MAX(work_year) AS Maximum_year FROM DataScienceSalaries;

--- DATA IS COLLECTED FROM 2020 AND 2022

--- a) WITHOUT CONSIDERING COMPANY LOCATION ----------------------------------------------------------

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE"
FROM DataScienceSalaries
GROUP BY work_year
ORDER BY work_year ASC;

--- b) CONSIDERING COMPANY LOCATION ----------------------------------------------------------

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE",
company_location
FROM DataScienceSalaries
GROUP BY work_year, company_location
ORDER BY work_year, company_location ASC;

--- 1. EXPERIENCE LEVEL ------------------------------------------------------------------------------

--- a. ENTRY LEVEL (EN) ------------------------------------------------------------------------------

--- RANGE OF SALARY FOR ENTRY LEVEL IN 2020 GROUPED BY COMPANY LOCATION:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)",
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", experience_level, company_location
FROM DataScienceSalaries
WHERE experience_level LIKE 'EN'
GROUP BY experience_level, company_location, work_year
ORDER BY work_year, experience_level ASC;

--- b. MID LEVEL/INTERMEDIATE (MI) --------------------------------------------------------------------------------

--- RANGE OF SALARY FOR INTERMEDIATE LEVEL IN 2020-2022 GROUPED BY COMPANY LOCATION:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE",
experience_level, company_location
FROM DataScienceSalaries
WHERE experience_level LIKE 'MI'
GROUP BY experience_level, company_location, work_year
ORDER BY work_year, experience_level ASC;

--- c. SENIOR-LEVEL/EXPERT (SE) ----------------------------------------------------------------------------------

--- RANGE OF SALARY FOR SENIOR LEVEL IN 2020-2022 GROUPED BY COMPANY LOCATION:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", 
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", experience_level, company_location
FROM DataScienceSalaries
WHERE experience_level LIKE 'SE'
GROUP BY experience_level, company_location, work_year
ORDER BY work_year, experience_level ASC;

--- d. EXECUTIVE-LEVEL/DIRECTOR (EX) ---------------------------------------------------------------------------

--- RANGE OF SALARY FOR EXECUTIVE LEVEL IN 2020-2022 GROUPED BY COMPANY LOCATION:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", 
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", experience_level, company_location
FROM DataScienceSalaries
WHERE experience_level LIKE 'EX'
GROUP BY experience_level, company_location, work_year
ORDER BY work_year, experience_level ASC;

--- 2. TYPE OF EMPLOYMENTS -------------------------------------------------------------------------------

--- a. PART-TIME (PT) ------------------------------------------------------------------------------------

--- RANGE OF SALARY FOR PART-TIME WORKERS IN 2020 GROUPED BY COMPANY LOCATION:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", 
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", employment_type, company_location
FROM DataScienceSalaries
WHERE employment_type LIKE 'PT'
GROUP BY employment_type,company_location, work_year
ORDER BY work_year, company_location ASC;

--- b. FULL-TIME (FT) ------------------------------------------------------------------------------------------

--- RANGE OF SALARY FOR FULL-TIME WORKERS IN 2020 GROUPED BY COMPANY LOCATION:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", 
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", employment_type, company_location
FROM DataScienceSalaries
WHERE employment_type LIKE 'FT'
GROUP BY employment_type,company_location, work_year
ORDER BY work_year, company_location ASC;

--- c. CONTRACT (CT) ----------------------------------------------------------------------------------------

--- RANGE OF SALARY FOR CONTRACTED WORKERS IN 2020-2022 GROUPED BY COMPANY LOCATION:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", 
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", employment_type, company_location
FROM DataScienceSalaries
WHERE employment_type LIKE 'CT'
GROUP BY employment_type,company_location, work_year
ORDER BY work_year, company_location ASC;

--- d. FREELANCE (FL) -----------------------------------------------------------------------------------

--- RANGE OF SALARY FOR FREELANCE WORKERS IN 2020-2022 GROUPED BY COMPANY LOCATION:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", 
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", employment_type, company_location
FROM DataScienceSalaries
WHERE employment_type LIKE 'FL'
GROUP BY employment_type,company_location, work_year
ORDER BY work_year, company_location ASC;

--- 3. JOB TITLES ------------------------------------------------------------------------------------

--- EXTRACTING LIST OF JOB TITLES (WITHOUT DUPLICATES) --------------------------------------------

SELECT DISTINCT(job_title) FROM DataScienceSalaries;

--- EXTRACTING LIST OF JOB TITLES FOR EACH EXPERIENCE LEVEL ---------------------------------------

SELECT DISTINCT(job_title) FROM DataScienceSalaries WHERE experience_level LIKE 'EN';
SELECT DISTINCT(job_title) FROM DataScienceSalaries WHERE experience_level LIKE 'MI';
SELECT DISTINCT(job_title) FROM DataScienceSalaries WHERE experience_level LIKE 'SE';
SELECT DISTINCT(job_title) FROM DataScienceSalaries WHERE experience_level LIKE 'EX';

--- RANGE OF SALARIES FOR EACH JOB TITLES FOR EACH EXPERIENCE LEVEL IN 2020-2022------------------------

--- a. ENTRY LEVEL (EN)
SELECT work_year,MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", job_title,
experience_level
FROM DataScienceSalaries
WHERE experience_level LIKE 'EN'
GROUP BY job_title, work_year, experience_level
ORDER BY work_year, experience_level ASC;

--- b. MID LEVEL (MI)

SELECT work_year,MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", job_title,
experience_level
FROM DataScienceSalaries
WHERE experience_level LIKE 'MI'
GROUP BY job_title, work_year, experience_level
ORDER BY work_year, experience_level ASC;

--- c. SENIOR LEVEL (SE)

SELECT work_year,MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", job_title,
experience_level
FROM DataScienceSalaries
WHERE experience_level LIKE 'SE'
GROUP BY job_title, work_year, experience_level
ORDER BY work_year, experience_level ASC;

--- d. EXECUTIVE LEVEL (EX)

SELECT work_year,MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", job_title,
experience_level
FROM DataScienceSalaries
WHERE experience_level LIKE 'EX'
GROUP BY job_title, work_year, experience_level
ORDER BY work_year, experience_level ASC;

--- 4. REMOTE RATIO ----------------------------------------------------------------------------------------

--- Remote ratio = 0 => No remote work
--- Remote ratio = 50 => Partially remote
--- Remote ratio = 100 => Fully remote

SELECT * FROM DataScienceSalaries WHERE remote_ratio = 0 ORDER BY company_size ASC;
SELECT * FROM DataScienceSalaries WHERE remote_ratio = 50 ORDER BY company_size ASC;
SELECT * FROM DataScienceSalaries WHERE remote_ratio = 100 ORDER BY company_size ASC;

--- RANGE OF SALARY ACCORDING TO REMOTE RATIO IN 2020:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE",remote_ratio
FROM DataScienceSalaries
GROUP BY remote_ratio, work_year
ORDER BY work_year, remote_ratio ASC;

--- 5. COMPANY SIZE -------------------------------------------------------------------

--- Company size : S => Employees < 50
--- Company size : M => Employees BETWEEN 50 AND 250
--- Company size : L => Employees > 250

--- RANGE OF SALARY ACCORDING TO COMPANY SIZE IN 2020-2022:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", company_size
FROM DataScienceSalaries
GROUP BY company_size, work_year
ORDER BY work_year, company_size ASC;

--- 6. COMBINATION OF EXPERIENCE LEVEL AND COMPANY SIZE --------------------------------------------

--- a. ENTRY-LEVEL (EN) -----------------------------------------------------------------------

--- RANGE OF SALARY FOR ENTRY LEVEL WORKERS ACCORDING TO COMPANY SIZE, IN 2020-2022:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)",
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE",experience_level, company_size
FROM DataScienceSalaries
WHERE experience_level LIKE 'EN'
GROUP BY experience_level,company_size, work_year
ORDER BY work_year, company_size ASC;

--- b. MID-LEVEL (MI) -----------------------------------------------------------------------

--- RANGE OF SALARY FOR MID-LEVEL WORKERS ACCORDING TO COMPANY SIZE, IN 2020-2022:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", 
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", experience_level,company_size
FROM DataScienceSalaries
WHERE experience_level LIKE 'MI'
GROUP BY experience_level,company_size, work_year
ORDER BY work_year, company_size ASC;

--- c. SENIOR LEVEL (SE) -----------------------------------------------------------------------

--- RANGE OF SALARY FOR SENIOR LEVEL WORKERS ACCORDING TO COMPANY SIZE, IN 2020-2022:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", 
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE",experience_level,company_size
FROM DataScienceSalaries
WHERE experience_level LIKE 'SE'
GROUP BY experience_level,company_size, work_year
ORDER BY work_year, company_size ASC;

--- d. EXECUTIVE LEVEL (EX) -----------------------------------------------------------------------

--- RANGE OF SALARY FOR EXECUTIVE LEVEL WORKERS ACCORDING TO COMPANY SIZE, IN 2020-2022:

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)",
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE",experience_level,company_size
FROM DataScienceSalaries
WHERE experience_level LIKE 'EX'
GROUP BY experience_level,company_size, work_year
ORDER BY work_year, company_size ASC;

--- 7. COMBINATION OF EXPERIENCE LEVEL AND EMPLOYMENT TYPE

--- a. ENTRY LEVEL

--- RANGE OF SALARY FOR ENTRY-LEVEL FOR EACH EMPLOYMENT TYPE FOR 2020-2022

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", 
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE",experience_level, employment_type
FROM DataScienceSalaries
WHERE experience_level LIKE 'EN'
GROUP BY experience_level, employment_type, work_year
ORDER BY work_year, employment_type ASC;

--- b. MID LEVEL

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", 
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", experience_level, employment_type
FROM DataScienceSalaries
WHERE experience_level LIKE 'MI'
GROUP BY experience_level, employment_type, work_year
ORDER BY work_year, employment_type ASC;

--- c. SENIOR LEVEL

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)", 
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE", experience_level, employment_type
FROM DataScienceSalaries
WHERE experience_level LIKE 'SE'
GROUP BY experience_level, employment_type, work_year
ORDER BY work_year, employment_type ASC;

--- d. EXECUTIVE LEVEL

SELECT work_year, MIN(salary_in_usd) AS "MINIMUM SALARY (in USD)",
MAX(salary_in_usd) AS "MAXIMUM SALARY (in USD)",
MAX(salary_in_usd)-MIN(salary_in_usd) AS "SALARY RANGE",experience_level, employment_type
FROM DataScienceSalaries
WHERE experience_level LIKE 'EX'
GROUP BY experience_level, employment_type, work_year
ORDER BY work_year, employment_type ASC;

--- 9. ANALYZING THE POSITIONS HAVING LOWEST SALARY AND THE HIGHEST SALARY (in USD) -------------------------------------------

--- THE POSITIONS WITH THE LOWEST SALARY IN:
--- a. 2020
SELECT * FROM DataScienceSalaries
WHERE salary_in_usd = (SELECT MIN(salary_in_usd) FROM DataScienceSalaries WHERE work_year LIKE '2020')
AND work_year LIKE '2020';

--- b. 2021
SELECT * FROM DataScienceSalaries
WHERE salary_in_usd = (SELECT MIN(salary_in_usd) FROM DataScienceSalaries WHERE work_year LIKE '2021')
AND work_year LIKE '2021';

--- c. 2022
SELECT * FROM DataScienceSalaries
WHERE salary_in_usd = (SELECT MIN(salary_in_usd) FROM DataScienceSalaries WHERE work_year LIKE '2022')
AND work_year LIKE '2022';

--- THE POSITIONS WITH THE HIGHEST SALARY IN:
--- a. 2020
SELECT * FROM DataScienceSalaries
WHERE salary_in_usd = (SELECT MAX(salary_in_usd) FROM DataScienceSalaries WHERE work_year LIKE '2020')
AND work_year LIKE '2020';

--- b. 2021
SELECT * FROM DataScienceSalaries
WHERE salary_in_usd = (SELECT MAX(salary_in_usd) FROM DataScienceSalaries WHERE work_year LIKE '2021')
AND work_year LIKE '2021';

--- c. 2022
SELECT * FROM DataScienceSalaries
WHERE salary_in_usd = (SELECT MAX(salary_in_usd) FROM DataScienceSalaries WHERE work_year LIKE '2022')
AND work_year LIKE '2022';
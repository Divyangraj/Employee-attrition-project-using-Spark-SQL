-- Databricks notebook source
-- DBTITLE 1,Employee attrion project problem statement:
-- MAGIC %md **Employee attrion project problem statement:**
-- MAGIC
-- MAGIC Employees are the backbone Of the organization. Organization's performance is heavily based on the quality Of the employees.
-- MAGIC Challenges that an organization has to face due employee attrition are:
-- MAGIC
-- MAGIC 1. Expensive in terms of both money and time to train new employees.
-- MAGIC 2. Loss of experienced employees
-- MAGIC 3. Impact in productivity
-- MAGIC 4. Impact profit
-- MAGIC
-- MAGIC Business questions to brainstorm:
-- MAGIC 1. What factors are contributing more to employee attrition?
-- MAGIC 2. What type of measures should the company take in order to retain their employees?

-- COMMAND ----------

select * from emp_attrition_csv limit 2;

-- COMMAND ----------

-- DBTITLE 1,Total Employee Count
select
  sum(EmployeeCount) as Total_Employee
from
  emp_attrition_csv

-- COMMAND ----------

-- DBTITLE 1,Find out Attrition Division
select sum(EmployeeCount),attrition from emp_attrition_csv group by attrition

-- COMMAND ----------

-- DBTITLE 1,AGE ANALYSIS
SELECT SUM(EMPLOYEECOUNT), 
case when Age BETWEEN 20 and 25 then '20-25' when age between 26 and 32 then '26-32' when age between 33 and 40 then '33-40' else '40+' end Age_group
FROM emp_attrition_csv
where attrition = 'Yes'
GROUP BY 2


-- COMMAND ----------

-- DBTITLE 1,FIND OUT ATTRITION BY DEPARTMENT
SELECT SUM(EMPLOYEECOUNT) as No_of_Employee ,department FROM emp_attrition_csv
where attrition = 'Yes'
GROUP BY department

-- COMMAND ----------

-- DBTITLE 1,ATTRITION BY EDUCATION
SELECT SUM(EMPLOYEECOUNT) as No_of_Employee,
case when Education = 1 then 'Below College' when Education = 2 then 'College' when Education = 3 then 'Bachelor' when Education = 4 then 'Master' else 'Doctor' end Education_Group
  FROM emp_attrition_csv
where attrition = 'Yes'
GROUP BY 2

-- COMMAND ----------

-- DBTITLE 1,ATTRITION BY ENVIRONMENT SATISFACTION
SELECT sum(EMPLOYEECOUNT) as No_of_Employee,
case when EnvironmentSatisfaction = 1 then ' Low' when EnvironmentSatisfaction = 2 then 'Medium' when EnvironmentSatisfaction = 3 then 'High' else 'Highly' end EnvironmentSatisfaction
  FROM emp_attrition_csv
where attrition = 'Yes'
GROUP BY 2

-- COMMAND ----------

-- DBTITLE 1,ATTRITION BY BUSINESS TRAVEL
SELECT SUM(EMPLOYEECOUNT) as No_of_Employee ,BusinessTravel 
FROM emp_attrition_csv
where attrition = 'Yes'
GROUP BY BusinessTravel

-- COMMAND ----------

-- DBTITLE 1,ATTRITION BY PERCENTAGE OF SALARY HIKE
SELECT SUM(EMPLOYEECOUNT) as No_of_Employee,
case when PercentSalaryHike BETWEEN 1 AND 10 THEN '1-10' when PercentSalaryHike BETWEEN 11 AND 15 THEN '11-15' WHEN PercentSalaryHike BETWEEN 16 AND 20 THEN '16-20' when PercentSalaryHike BETWEEN 21 AND 25 THEN '21-25' ELSE '26+' END HIKE_PERCENTAGE  
FROM emp_attrition_csv
where attrition = 'Yes'
GROUP BY 2


-- COMMAND ----------

SELECT DISTINCT PerformanceRating FROM emp_attrition_csv

-- COMMAND ----------

SELECT SUM(EMPLOYEECOUNT) AS TOTAL_EMPLOYEE, Gender
FROM emp_attrition_csv 
where attrition = 'Yes'
GROUP BY 2

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Conclusion:**

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 1. Employees of age between 26-32 are leaving organization.
-- MAGIC 2. Employees from Research and Develoment department are leaving organization.
-- MAGIC 3. 41.8% Employees having bachelor degree left organization.
-- MAGIC 4. 72% employees are not satisfied with environement location left organization.
-- MAGIC 5. 156 emoloyee who were travelling rarely left organization.

-- COMMAND ----------



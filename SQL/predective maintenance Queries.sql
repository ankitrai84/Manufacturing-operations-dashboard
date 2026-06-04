select * from machines_data;


-- 1. Total Production Loss

select sum(Production_Loss) Total_Production_Loss from machines_data;



-- 2. Failure Type Analysis

select Failure_Type , count(*) as Failure_Count from machines_data
where Machine_failure = 1
group by Failure_Type
order by 2 desc;



-- 3. High Risk Machines

select * from machines_data
where Risk_Level = "High Risk";



-- 4. Average Downtime by Failure Type

select Failure_Type, avg(Downtime_min) from machines_data
group by Failure_Type;


-- 5. Efficiency Analysis

select Risk_Level, avg(Efficiency) as Efficiency from machines_data
group by Risk_Level;


-- 6. Top Problem Machines (Simulated)

select Failure_Type, sum(Production_Loss)as Total_loss from machines_data
group by Failure_Type 
order by 2 Desc;



-- 7. Overall Machine Failure Rate

SELECT COUNT(*) AS total_machines,
SUM(Machine_failure) AS failed_machines,
ROUND(SUM(Machine_failure)*100 / COUNT(*), 2) AS failure_rate_percent
FROM machines_data;


-- 8. Avg Health Score by Machine Type

select Type, avg(Health_Score)as Avg_Health_Score
 from machines_data
 group by 1;


-- 9. 5. High Risk Machines (Actionable Insight)

select * from machines_data;

select UDI, Type, Failure_Type, Risk_Level, Downtime_min, Risk_Flag, Production_Loss, Product_ID from machines_data
where Risk_Level = 'High Risk'
order by Failure_Risk_Score desc;


-- 10.Efficiency vs Failure 

select Machine_failure , round(avg(Efficiency),2) as Average_Efficiency
 from machines_data
group by 1;


-- 11. Downtime Impact


select Machine_failure, round(avg(Downtime_min),2) Avgerage_downtime
 from machines_data
 group by 1;
 
 -- 12. high_risk_summary View 
 
 CREATE VIEW high_risk_summary AS
SELECT Failure_Type, COUNT(*) AS total_cases,
AVG(Downtime_min) AS avg_downtime, SUM(Production_Loss) AS total_loss
FROM machines_data
WHERE Risk_Level = 'High Risk'
GROUP BY Failure_Type;


select * from high_risk_summary;


-- 13. Failure Analysis View

CREATE VIEW failure_analysis_view AS
SELECT Failure_Type, COUNT(*) AS failures, 
AVG(Production_Loss) AS avg_loss, AVG(Downtime_min) AS avg_downtime
FROM machines_data
WHERE Machine_failure = 1
GROUP BY Failure_Type;

select * from failure_analysis_view;


-- 14. Machine Health Dashboard View 

CREATE VIEW machine_health_view AS
SELECT UDI, Type, Health_Score,
Risk_Level, Efficiency, Failure_Risk_Score
FROM machines_data;


select * from machine_health_view;



use manufacturing_project;



select Failure_Type, count(*) from machines_data
group by 1


-- Incident Module 
SELECT 
'incident_final_table',SRC.CDCTYPE,count(1) AS Source_Count
FROM qualcomm_mdsdb.incident_final SRC 
group by 1,2
UNION 
SELECT 
'f_incident_table',f.soft_deleted_flag,count(1) AS Fact_Count
FROM qualcomm_mdwdb.f_incident f 
group by 1,2
UNION 
SELECT 
'd_incident_table',d.soft_deleted_flag,count(1) AS Dimension_Count
FROM qualcomm_mdwdb.d_incident d 
group by 1,2;

=======================================
-- Task Module 
SELECT 
'task_final_table',SRC.CDCTYPE,count(1) AS Source_Count
FROM qualcomm_mdsdb.task_final SRC
group by 1,2
UNION 
SELECT 'f_task',TRGT.soft_deleted_flag,count(1) AS Task_Fact_Count
FROM qualcomm_mdwdb.f_task TRGT
group by 1,2
UNION 
SELECT 'd_task',DIM.soft_deleted_flag,count(1) AS Task_Dimension_Count
FROM qualcomm_mdwdb.d_task DIM
group by 1,2;

============================================

-- Request_item 

SELECT 
'sc_req_item_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM qualcomm_mdsdb.sc_req_item_final SRC
group by 1,2
UNION 
SELECT 'f_request_item',TRGT.soft_deleted_flag,count(1) AS Task_Fact_Count
FROM qualcomm_mdwdb.f_request_item TRGT
group by 1,2
UNION 
SELECT 'd_request_item',DIM.soft_deleted_flag,count(1) AS Task_Dimension_Count
FROM qualcomm_mdwdb.d_request_item DIM
group by 1,2


===================================

  -- Request Task 
  
SELECT 
'sc_task_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM qualcomm_mdsdb.sc_task_final SRC
group by 1,2
UNION 
SELECT 'f_request_task',TRGT.soft_deleted_flag,count(1) AS Task_Fact_Count
FROM qualcomm_mdwdb.f_request_task TRGT
group by 1,2
UNION 
SELECT 'd_request_task',DIM.soft_deleted_flag,count(1) AS Task_Dimension_Count
FROM qualcomm_mdwdb.d_request_task DIM
group by 1,2;

================================================


-- Major Incident

SELECT 
'u_major_incident_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM qualcomm_mdsdb.u_major_incident_final SRC
group by 1,2
UNION 
SELECT 'f_major_incident_c',TRGT.soft_deleted_flag,count(1) AS Task_Fact_Count
FROM qualcomm_mdwdb.f_major_incident_c TRGT
group by 1,2
UNION 
SELECT 'd_major_incident_c',DIM.soft_deleted_flag,count(1) AS Task_Dimension_Count
FROM qualcomm_mdwdb.d_major_incident_c DIM
group by 1,2


===============================================

-- Call

SELECT 
'new_call_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM qualcomm_mdsdb.new_call_final SRC
group by 1,2
UNION 
SELECT 'f_call',TRGT.soft_deleted_flag,count(1) AS Task_Fact_Count
FROM qualcomm_mdwdb.f_call TRGT
group by 1,2
UNION 
SELECT 'd_call',DIM.soft_deleted_flag,count(1) AS Task_Dimension_Count
FROM qualcomm_mdwdb.d_call DIM
group by 1,2

==============================================
-- Problem_final 


SELECT 'problem_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM qualcomm_mdsdb.problem_final SRC 
group by 1,2
UNION 
SELECT 'f_problem',TRGT.soft_deleted_flag,count(1) AS Task_Fact_Count
FROM qualcomm_mdwdb.f_problem TRGT 
UNION 
SELECT 'd_problem',TRGT.soft_deleted_flag,count(1) AS Task_Dimension_Count
FROM qualcomm_mdwdb.d_problem TRGT 
group by 1,2



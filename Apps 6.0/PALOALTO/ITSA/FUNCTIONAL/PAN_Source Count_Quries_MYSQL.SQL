-- ITSA_Incident_C,ITSA_Incident_Task_C,ITSA_Reassignment_C,ITSA_Incident Backlog,ITSA_Incident Detail_C,Onboarding_Incident Analysis_C,ITSA_Incident Keyword_C

SELECT 
'incident_final_table',SRC.CDCTYPE,count(1) AS Source_Count
FROM pan_mdsdb.incident_final SRC 
group by 1,2
UNION 
SELECT 
'f_incident_table',f.soft_deleted_flag,count(1) AS Fact_Count
FROM pan_mdwdb.f_incident f 
group by 1,2
UNION 
SELECT 
'd_incident_table',d.soft_deleted_flag,count(1) AS Dimension_Count
FROM pan_mdwdb.d_incident d 
group by 1,2

UNION 
-- ITSA_Change_C_Module 

SELECT 
'change_request_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM pan_mdsdb.change_request_final SRC 
group by 1,2
UNION 
SELECT 
'f_change_request_table',f.soft_deleted_flag,count(1) AS Fact_Count
FROM pan_mdwdb.f_change_request f 
group by 1,2
UNION 
SELECT 
'd_change_request',d.soft_deleted_flag,count(1) AS Dimension_Count
FROM pan_mdwdb.d_change_request d
group by 1,2
UNION 
-- ITSA_Request Item_C_Module 

SELECT 
'sc_req_item_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM pan_mdsdb.sc_req_item_final SRC 
group by 1,2
UNION 
SELECT 
'f_request_item',f.soft_deleted_flag,count(1) AS Fact_Count
FROM pan_mdwdb.f_request_item f 
group by 1,2
UNION 
SELECT 
'd_request_item',d.soft_deleted_flag,count(1) AS Dim_Count
FROM pan_mdwdb.d_request_item d
group by 1,2

UNION 
-- ITSA_Request Task_C_Module

SELECT 
'pan_mdsdb.sc_task_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM pan_mdsdb.sc_task_final SRC
group by 1,2
UNION 
SELECT 
'_request_task',f.soft_deleted_flag,count(1) AS Fact_Count
FROM pan_mdwdb.f_request_task f
group by 1,2
UNION 
SELECT 
'd_request_task',d.soft_deleted_flag,count(1) AS Dim_Count
FROM pan_mdwdb.d_request_task d
group by 1,2

UNION 
-- ITSA_Service_Request_C_Module 

SELECT 
'u_service_request_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM pan_mdsdb.u_service_request_final SRC
group by 1,2
UNION 
SELECT 
'f_service_request_c',f.soft_deleted_flag,count(1) AS Fact_Count
FROM pan_mdwdb.f_service_request_c f
group by 1,2
UNION 
SELECT 
'd_service_request_c',d.soft_deleted_flag,count(1) AS Dim_Count
FROM pan_mdwdb.d_service_request_c d
group by 1,2

UNION 
-- ITSA_SR Task_C_Module 

SELECT 
'u_stask_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM pan_mdsdb.u_stask_final SRC
group by 1,2
UNION 
SELECT 
'f_sr_task_c',f.soft_deleted_flag,count(1) AS Fact_Count
FROM pan_mdwdb.f_sr_task_c f 
group by 1,2
UNION 
SELECT 
'd_sr_task_c',d.soft_deleted_flag,count(1) AS Dim_Count
FROM pan_mdwdb.d_sr_task_c d 
group by 1,2
UNION 

-- ITSA_Survey_C_Module(Need to write the Code)


-- ITSA_Walk_Up_C_Module

SELECT 
'u_walk_up_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM pan_mdsdb.u_walk_up_final SRC 
group by 1,2
UNION 
SELECT 
'f_walk_up_c',f.soft_deleted_flag,count(1) AS Fact_Count
FROM pan_mdwdb.f_walk_up_c f
group by 1,2
UNION 
SELECT 
'd_walk_up_c',d.soft_deleted_flag,count(1) AS Dim_Count
FROM pan_mdwdb.d_walk_up_c d 
group by 1,2

UNION 
-- ITSA_Problem_C,ITSA_Problem Impacted Parties_C

SELECT 
'problem_final',SRC.CDCTYPE,count(1) AS Source_Count
FROM pan_mdsdb.problem_final SRC 
group by 1,2
UNION 
SELECT 
'f_problem',f.soft_deleted_flag,count(1) AS Fact_Count
FROM pan_mdwdb.f_problem f 
group by 1,2
UNION 
SELECT 
'd_problem',d.soft_deleted_flag,count(1) AS Dim_Count
FROM pan_mdwdb.d_problem d  
group by 1,2
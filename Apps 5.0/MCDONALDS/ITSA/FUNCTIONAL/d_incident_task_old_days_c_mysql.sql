

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident_task.parent_incident_task_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM mcdonalds_mdsdb.incident_task_final SRC 
 LEFT JOIN mcdonalds_mdwdb.d_incident_task LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE u_old_days<> (TRGT.old_days_c))b
 
 

 
 
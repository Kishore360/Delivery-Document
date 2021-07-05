

SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_incident_task.parent_incident_task_key' ELSE 'SUCCESS' END as Message from
 (select count(1) cnt 
 FROM   mcd_mdsdb.incident_task_final SRC 
 LEFT JOIN mcd_mdwdb.d_incident_task_c LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE u_ola_days<> (LKP.ola_days_c))b
 
 

 
 
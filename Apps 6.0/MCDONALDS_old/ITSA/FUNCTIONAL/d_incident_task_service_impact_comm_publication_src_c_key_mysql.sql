

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident_task.parent_incident_task_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM mcdonalds_mdsdb.incident_task_final SRC 
 LEFT JOIN mcdonalds_mdwdb.d_incident_task_c LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
LEFT JOIN mcdonalds_mdwdb.d_lov lkp
ON COALESCE(CONCAT('REMAINDER_NOTIFICATIONS_C~INCIDENT_TASK~~~',SRC.u_reminder_notifications),'UNSPECIFIED') =lkp.row_id and SRC.sourceinstance = lkp.source_id
 WHERE lkp.row_key<> (LKP.service_impact_comm_publication_src_c_key))b
 
 
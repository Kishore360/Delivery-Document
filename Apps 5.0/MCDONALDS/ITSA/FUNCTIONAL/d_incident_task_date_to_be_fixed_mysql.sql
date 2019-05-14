SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident_task_c.date_to_be_fixed' ELSE 'SUCCESS' END as Message 
 from (select count(1) cnt 
 FROM mcdonalds_mdsdb.incident_task_final SRC 
 LEFT JOIN mcdonalds_mdwdb.d_incident_task_c TRGT 
 ON ( SRC.sys_id= TRGT.row_id 
AND SRC.sourceinstance= TRGT.source_id )
 WHERE COALESCE(CONVERT_TZ(SRC.u_date_to_be_fixed,'GMT','US/Central'),'UNSPECIFIED')<> (TRGT.date_to_be_fixed))b;
 
 
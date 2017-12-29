SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_major_incident.parent_task_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.u_major_incident_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_major_incident_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 join qualcomm_mdwdb.d_task c
on COALESCE(SRC.parent,UNSPECIFIED')=c.row_id and SRC.sourceinstance=c.source_id
where coalesce(c.row_key, case when SRC.parent is null then 0 else -1 end) <> TRGT.parent_task_key;


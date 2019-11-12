SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM wpl_mdsdb.task_sla_final SRC 
 LEFT JOIN wpl_mdwdb.f_task_sla TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN wpl_mdwdb.d_internal_contact LKP 
 ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_sla_assigned_to),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_sla_assigned_to IS NULL THEN 0 else -1 end)<> (TRGT.sla_assigned_to_c_key)
 and SRC.cdctype='X'
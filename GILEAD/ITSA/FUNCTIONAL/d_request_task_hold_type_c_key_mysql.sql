SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.domain_key' ELSE 'SUCCESS' END as Message from(
 select
 COALESCE(LKP.row_key,CASE WHEN SRC.u_hold_type  IS NULL THEN 0 else -1 end)abc, (TRGT.hold_type_c_key)def
 FROM gilead_mdsdb.sc_task_final SRC 
 LEFT JOIN gilead_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN gilead_mdwdb.d_lov LKP 
 ON ( concat('HOLD_TYPE~SC_TASK','~~~',SRC.u_hold_type) = LKP.row_id 
AND LKP.dimension_class='HOLD_TYPE~SC_TASK'))a
 WHERE abc<>def

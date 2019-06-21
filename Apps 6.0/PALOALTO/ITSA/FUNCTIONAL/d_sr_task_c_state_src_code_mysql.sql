
 
  SELECT 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_sr_task_c_state_src_code' ELSE 'SUCCESS' END as Message 
 FROM 
 (Select count(1) as cnt
 FROM paloalto_mdsdb.u_stask_final SRC 
 LEFT JOIN paloalto_mdwdb.d_sr_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(SRC.state,'UNSPECIFIED')<>TRGT.state_src_code)temp;
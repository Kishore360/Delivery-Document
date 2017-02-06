SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
From mercuryins_mdsdb.task_final SRC1
join
mercuryins_mdsdb.sc_request_final  SRC
on  SRC1.sys_id=SRC.sys_id and SRC.sourceinstance=SRC1.sourceinstance
JOIN mercuryins_mdwdb.f_task_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
JOIN mercuryins_mdwdb.d_lov LKP 
ON COALESCE( concat( 'URGENCY~SC_REQUEST~~~' ,upper( SRC.urgency)),'UNSPECIFIED') = LKP.row_id and SRC1.sys_class_name = 'SC_REQUEST' 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> (TRGT.urgency_src_key) 

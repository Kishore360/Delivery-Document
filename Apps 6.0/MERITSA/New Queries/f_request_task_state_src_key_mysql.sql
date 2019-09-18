SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_request_task.state_src_key' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.sc_task_final SRC 
 LEFT JOIN mercury_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) and SRC.cdctype<>'D'
join mercury_mdwdb.d_lov LKP
on COALESCE(CONCAT('STATE','~','SC_TASK','~',UPPER(SRC.state)),'UNSPECIFIED') = LKP.row_id 
where coalesce(LKP.row_key,case when SRC.state is null then 0 else -1 end)<>TRGT.state_src_key
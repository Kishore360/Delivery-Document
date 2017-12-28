SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.task_count_c' ELSE 'SUCCESS' END as Message FROM rogers_mdsdb.change_request_final  SRC JOIN rogers_mdwdb.f_change_request TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.u_task_count <> (TRGT.task_count_c) 

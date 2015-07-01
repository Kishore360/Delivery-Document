SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.closed_on' ELSE 'SUCCESS' END as Message  FROM <<tenant>>_mdsdb.sc_task_final SRC  LEFT JOIN <<tenant>>_mdwdb.d_request_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.closed_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)<> TRGT.closed_on 
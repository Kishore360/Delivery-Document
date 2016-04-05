SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.closed_on' ELSE 'SUCCESS' END as Message  
FROM molinahealth_mdsdb.problem_final SRC  LEFT JOIN molinahealth02_mdwdb.d_problem TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE 
coalesce(convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>))<> coalesce(TRGT.closed_on) 

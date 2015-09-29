SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.closed_on' ELSE 'SUCCESS' END as Message  FROM <<tenant>>_mdsdb.incident_final SRC  LEFT JOIN <<tenant>>_mdwdb.d_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.closed_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)<> TRGT.closed_on 

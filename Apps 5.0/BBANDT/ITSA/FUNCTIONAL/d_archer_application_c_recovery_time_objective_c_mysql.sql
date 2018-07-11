SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_archer_application_c.recovery_time_objective_c' ELSE 'SUCCESS' END as Message FROM bbandt_mdsdb.app_vwarchertonumerifyfeed_final  SRC JOIN bbandt_mdwdb.d_archer_application_c TRGT ON (SRC.application_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.recovery_time_objective <> (TRGT.recovery_time_objective_c) 

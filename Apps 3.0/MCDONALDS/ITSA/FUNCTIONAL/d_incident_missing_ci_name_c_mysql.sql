SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.missing_ci_name_c' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.incident_final SRC  LEFT JOIN <<tenant>>_mdwdb.d_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.u_missing_ci_name,'')<> COALESCE(TRGT.missing_ci_name_c ,'')
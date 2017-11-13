SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.incident_key' ELSE 'SUCCESS' END as Message FROM rogersdev_mdsdb.change_request_final  SRC JOIN rogersdev_mdwdb.f_change_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN rogersdev_mdwdb.d_incident LKP ON ( concat( '' ,upper( SRC.u_incident)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_incident IS NULL THEN 0 else -1 end)<> (TRGT.incident_key) 

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.priority_src_key' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT ON (SRC.entry_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN schneider_mdwdb.d_lov LKP ON ( concat( 'PRIORITY~INCIDENT~~~' ,upper( SRC.priority)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key) 

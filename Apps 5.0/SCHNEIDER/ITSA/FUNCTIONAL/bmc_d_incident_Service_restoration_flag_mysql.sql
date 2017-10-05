SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.Service_restoration_flag' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT ON (SRC.entry_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE (CASE WHEN SRC.service_type=0.00  then 'Y' else 'N' END) <> (TRGT.Service_restoration_flag) 

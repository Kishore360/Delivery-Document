SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.created_on' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.sourceid AND SRC.sourceinstance = TRGT.sourceid ) WHERE convert_tz(SRC.reported_date,'GMT','America/Los_Angeles')<> (TRGT.created_on) 

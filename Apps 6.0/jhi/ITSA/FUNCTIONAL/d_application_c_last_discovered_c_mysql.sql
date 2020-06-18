SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application_c.last_discovered_c' ELSE 'SUCCESS' END as Message FROM jhi_mdsdb.cmdb_ci_spkg_final  SRC JOIN jhi_mdwdb.d_application_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) WHERE convert_tz(SRC.last_discovered,'GMT','UTC')<> (TRGT.last_discovered_c) 

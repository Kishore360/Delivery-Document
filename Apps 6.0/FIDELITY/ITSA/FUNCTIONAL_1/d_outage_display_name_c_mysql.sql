SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.display_name_c' ELSE 'SUCCESS' END as Message FROM fidelity_mdsdb.cmdb_ci_outage_final  SRC JOIN fidelity_mdwdb.d_outage TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE coalesce(SRC.u_display_name,'UNSPECIFIED') <> (TRGT.display_name_c) 

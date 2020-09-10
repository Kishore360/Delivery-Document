SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.outage_parent_outage_c_key' ELSE 'SUCCESS' END as Message FROM fidelity_mdsdb.cmdb_ci_outage_final  SRC JOIN fidelity_mdwdb.d_outage TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN fidelity_mdwdb.d_outage LKP ON ( coalesce(SRC.u_parent_outage,
                'UNSPECIFIED')  = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_parent_outage IS NULL THEN 0 else -1 end)<> (TRGT.outage_parent_outage_c_key) 

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application_c.application_business_criticality_c_key' ELSE 'SUCCESS' END as Message FROM jhi_mdsdb.cmdb_ci_spkg_final  SRC JOIN jhi_mdwdb.d_application_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN jhi_mdwdb.d_lov LKP ON ( concat( 'U_BUSINESS_CRITICALITY_C~CMDB_CI_SPKG~' ,upper( SRC.u_business_criticality)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_business_criticality IS NULL THEN 0 else -1 end)<> (TRGT.application_business_criticality_c_key) 

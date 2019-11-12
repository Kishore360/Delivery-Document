SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.vendor_c_key' ELSE 'SUCCESS' END as Message FROM wpl_mdsdb.incident_final  SRC JOIN wpl_mdwdb.f_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN wpl_mdwdb.d_internal_organization LKP ON ( concat( 'SUBSIDIARY~' ,upper( SRC.u_vendor)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_vendor IS NULL THEN 0 else -1 end)<> (TRGT.vendor_c_key) and SRC.cdctype='X'

SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.resolution_ci_detail_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from truist_mdsdb.incident_final SRC 
 LEFT JOIN truist_mdwdb.f_incident TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN truist_mdwdb.d_configuration_item LKP ON ( SRC.u_resolution_ci= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_resolution_ci IS NULL THEN 0 else -1 end)<> TRGT.resolution_ci_detail_key
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='Y')ma;


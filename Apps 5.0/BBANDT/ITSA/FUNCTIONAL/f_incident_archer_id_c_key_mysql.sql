SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident_archer_id_c_key' ELSE 'SUCCESS' END as Message
FROM(select count(1) as cnt from  bbandt_mdsdb.incident_final SRC 
LEFT JOIN bbandt_mdwdb.d_software_c LKP 
ON ( SRC.cmdb_ci= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
LEFT JOIN bbandt_mdwdb.f_incident TRGT 
ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else -1 end)<> 
TRGT.archer_id_c_key and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='Y')ma



SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.csi_service_ref_c_key' ELSE 'SUCCESS' END as Message
FROM usf_mdsdb.incident_final  SRC
JOIN usf_mdwdb.f_incident TRGT
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
LEFT JOIN usf_mdwdb.d_service LKP ON (concat( 'BUSINESS_SERVICE~' ,upper( SRC.u_csi_service_ref)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_csi_service_ref IS NULL THEN 0 else -1 end)<> (TRGT.csi_service_ref_c_key) 
;

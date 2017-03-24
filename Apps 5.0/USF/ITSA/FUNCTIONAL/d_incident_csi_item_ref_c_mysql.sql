
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.csi_item_ref_c ' ELSE 'SUCCESS' END as Message
FROM usf_mdsdb.incident_final  SRC
JOIN usf_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
LEFT JOIN usf_mdsdb.u_csi_category_final LKP ON SRC.u_csi_item_ref  = LKP.sys_id
WHERE COALESCE(LKP.u_name,'UNSPECIFIED')<>(TRGT.csi_item_ref_c) ;
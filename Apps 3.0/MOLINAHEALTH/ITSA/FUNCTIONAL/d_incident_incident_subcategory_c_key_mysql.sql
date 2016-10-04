SELECT 
 CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.incident_subcategory_c_key' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.incident_final src 
LEFT JOIN molinahealth_mdwdb.d_incident trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_lov lkp ON concat('INCIDENT_SUBCATEGORY_C~INCIDENT~~~',upper(src.u_incident_subcategory)) = lkp.row_id AND src.sourceinstance = lkp.source_id and  lkp.dimension_class =  'INCIDENT_SUBCATEGORY_C~INCIDENT'
WHERE COALESCE(lkp.row_key,CASE WHEN src.u_incident_subcategory IS NULL THEN 0 else -1 end) <> (trgt.incident_subcategory_c_key) ;
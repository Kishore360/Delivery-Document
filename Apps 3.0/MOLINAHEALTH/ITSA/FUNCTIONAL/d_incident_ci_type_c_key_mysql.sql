SELECT 
 CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.ci_type_c_key' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.incident_final src 
LEFT JOIN molinahealth_mdwdb.d_incident trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_lov lkp ON concat('CI_TYPE_C~INCIDENT~~~',upper(src.u_ci_type)) = lkp.row_id AND src.sourceinstance = lkp.source_id and  lkp.dimension_class =  'CI_TYPE_C~INCIDENT'
WHERE COALESCE(lkp.row_key,CASE WHEN src.u_ci_type IS NULL THEN 0 else -1 end) <> (trgt.ci_type_c_key);

SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.number_of_impacted_users_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.incident_final src 
LEFT JOIN molinahealth_mdwdb.f_incident trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE src.u_number_of_impacted_users <> trgt.number_of_impacted_users_c;
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.vendor_c_key' ELSE 'SUCCESS' END as Message
FROM (SELECT 
src.sys_id,trgt.row_id,src.vendor,trgt.pivot_date,
COALESCE(lkp.row_key,CASE WHEN src.vendor IS NULL THEN 0 else -1 end) , (trgt.vendor_c_key)
FROM molinahealth_mdsdb.incident_final src 
JOIN molinahealth_mdwdb.f_incident trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_internal_organization lkp ON concat( 'SUBSIDIARY~',src.vendor) = (lkp.row_id) AND src.sourceinstance = lkp.source_id
and DATE_FORMAT(trgt.pivot_date, '%Y-%m-%d %H:%i:%s') BETWEEN effective_from AND effective_to
WHERE COALESCE(lkp.row_key,CASE WHEN src.vendor IS NULL THEN 0 else -1 end) <> (trgt.vendor_c_key)
)a;
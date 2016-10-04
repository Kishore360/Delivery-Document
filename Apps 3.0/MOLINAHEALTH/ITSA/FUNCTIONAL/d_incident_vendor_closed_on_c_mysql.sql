SELECT  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.vendor_closed_on_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.incident_final src 
LEFT JOIN molinahealth_mdwdb.d_incident trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE convert_tz(src.vendor_closed_at,'UTC','America/Los_Angeles') <>  trgt.vendor_closed_on_c;
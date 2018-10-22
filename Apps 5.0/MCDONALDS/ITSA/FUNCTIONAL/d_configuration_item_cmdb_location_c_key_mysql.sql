SELECT 
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  THEN 'MDS to DWH data validation failed for f_change_request.scafe_core_realm_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM (SELECT src.sys_id,src.sourceinstance,src.u_site_location,COALESCE (CONCAT('CMDB_LOCATION_C~',u_site_location),'UNSPECIFIED') as jn1 FROM mcdonalds_mdsdb.cmdb_ci_final src )src
LEFT JOIN mcdonalds_mdwdb.d_configuration_item trgt ON (src.sys_id=trgt.row_id AND src.sourceinstance=trgt.source_id)
LEFT JOIN mcdonalds_mdwdb.d_location lkp ON jn1 = lkp.row_id AND lkp.source_id =src.sourceinstance

WHERE COALESCE(lkp.row_key, CASE WHEN src.u_site_location IS NULL THEN 0 ELSE -1 END) <> trgt.cmdb_location_c_key 
)tem;


fs_change_request,ds_change_request,ds_configuration_item,fs_change_request_application_approver_c,fs_incident_task_c,ds_incident_task_c
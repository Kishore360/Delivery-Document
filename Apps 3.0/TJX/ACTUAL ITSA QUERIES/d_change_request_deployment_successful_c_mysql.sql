SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
	   CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.deployment_successful_c' ELSE 'SUCCESS' END as Message 
-- COALESCE(src.u_deployment_successful,'UNSPECIFIED') ,u_deployment_successful, deployment_successful_c
FROM tjx_mdsdb.change_request_final src
LEFT JOIN tjx_mdwdb.d_change_request trgt on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE COALESCE(src.u_deployment_successful,'UNSPECIFIED') <> deployment_successful_c
;
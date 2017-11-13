SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
	   CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' ELSE 'SUCCESS' END as Message 
-- IF(src.review_status =2 OR src.u_deployment_successful = 'No','Y','N') ,src.review_status,src.u_deployment_successful,failure_flag
FROM tjx_mdsdb.change_request_final src
LEFT JOIN tjx_mdwdb.d_change_request trgt on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE  IF(src.review_status =2 OR src.u_deployment_successful = 'No','Y','N') <> failure_flag
;

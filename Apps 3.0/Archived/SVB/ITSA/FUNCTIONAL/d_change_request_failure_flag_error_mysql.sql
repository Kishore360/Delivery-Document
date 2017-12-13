SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM   svb_mdsdb.change_request_final SRC 
       LEFT JOIN svb_mdwdb.d_change_request TRGT 
              ON ( SRC.sys_id = TRGT.row_id 
                   AND SRC.sourceinstance = TRGT.source_id ) 
       JOIN svb_mdwdb.d_lov_map br 
         ON (SRC.review_status = br.dimension_code 
            )
WHERE  CASE WHEN closure_code_src_code_c  
IN ('Successful','successful_issues','Partially Successful') THEN 'N' WHEN  
closure_code_src_code_c  IN ('backed_out','Unsuccessful - Backed Out','Unsuccessful - Not Backed Out') 
THEN 'Y' ELSE NULL END <> TRGT.failure_flag 

	   
	   
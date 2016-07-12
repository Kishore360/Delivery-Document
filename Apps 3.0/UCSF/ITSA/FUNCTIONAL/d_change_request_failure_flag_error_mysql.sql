SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM   ucsf_mdsdb.change_request_final SRC 
       LEFT JOIN ucsf_mdwdb.d_change_request TRGT 
              ON ( SRC.sys_id = TRGT.row_id 
                   AND SRC.sourceinstance = TRGT.source_id ) 
       JOIN ucsf_mdwdb.d_lov_map br 
         ON (SRC.review_status = br.dimension_code 
            AND SRC.sourceinstance = br.source_id )
WHERE  CASE WHEN SRC.u_change_result='Successful' THEN 'N' ELSE 'Y'  
       END <> TRGT.failure_flag 
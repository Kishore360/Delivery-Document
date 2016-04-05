SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM   molinahealth_mdsdb.change_request_final SRC 
       LEFT JOIN molinahealth02_mdwdb.d_change_request TRGT 
              ON ( SRC.sys_id = TRGT.row_id 
                   AND SRC.sourceinstance = TRGT.source_id ) 
       JOIN molinahealth02_mdwdb.d_lov_map br 
         ON (SRC.review_status = br.dimension_code 
            AND SRC.sourceinstance = br.source_id )
WHERE  CASE 
         WHEN br.dimension_wh_code = 'FAIL' 
              AND br.dimension_class = 'REVIEW_STATUS~CHANGE_REQUEST' THEN 'Y' 
         ELSE 'N' 
       END <> TRGT.failure_flag 

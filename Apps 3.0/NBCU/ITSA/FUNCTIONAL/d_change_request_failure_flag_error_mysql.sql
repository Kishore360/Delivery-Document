SELECT  CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN Count(1) > 0 THEN  'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message
FROM   nbcu_mdsdb.change_request_final SRC 
       JOIN nbcu_mdwdb.d_change_request TRGT 
              ON ( SRC.sys_id = TRGT.row_id 
                   AND SRC.sourceinstance = TRGT.source_id ) 
       JOIN nbcu_mdwdb.d_lov br 
         ON (SRC.u_completion_code = br.dimension_code 
            AND SRC.sourceinstance = br.source_id )
WHERE  br.dimension_class = 'COMPLETION_CODE_C~CHANGE_REQUEST' and (CASE 
         WHEN br.dimension_code like '%Unsuccessful%' 
            THEN 'Y' 
         ELSE 'N' 
       END <> TRGT.failure_flag)

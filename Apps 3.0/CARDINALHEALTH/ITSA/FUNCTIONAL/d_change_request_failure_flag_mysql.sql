SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM   cardinalhealth_mdsdb.change_request_final SRC 
       LEFT JOIN cardinalhealth_mdwdb.d_change_request TRGT 
              ON ( SRC.sys_id = TRGT.row_id 
                   AND SRC.sourceinstance = TRGT.source_id ) 
WHERE  CASE WHEN SRC.u_success_status LIKE '%fail%' THEN 'Y' ELSE 'N' END
 <> TRGT.failure_flag 
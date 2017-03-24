SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM   asu_mdsdb.change_request_final SRC 
        JOIN asu_mdwdb.d_change_request TRGT 
              ON ( SRC.sys_id = TRGT.row_id 
                   AND SRC.sourceinstance = TRGT.source_id ) 
 join asu_mdwdb.f_change_request f on f.change_request_key=TRGT.row_key
 join asu_mdwdb.d_lov lov ON f.closed_status_src_c_key = lov.row_key 
AND lov.dimension_class = 'CLOSED_STATUS~CHANGE_REQUEST'
       JOIN asu_mdwdb.d_lov_map br 
         ON (f.state_src_key=br.src_key ) and  br.wh_dimension_class = 'STATE_WH~CHANGE_REQUEST' AND dimension_wh_code = 'CLOSED'
WHERE  CASE 
         WHEN lov.dimension_name LIKE '%Unsuccess%' THEN 'Y' 
         ELSE 'N' 
       END <> TRGT.failure_flag 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, 
 CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_change_request.failure_flag' ELSE 'SUCCESS' END AS Message
FROM (SELECT count(1) as CNT
FROM   #MDS_TABLE_SCHEMA.change_request_final SRC 
        JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
              ON ( SRC.sys_id = TRGT.row_id 
                   AND SRC.sourceinstance = TRGT.source_id )
			JOIN #DWH_TABLE_SCHEMA.f_change_request f
on f.change_request_key=TRGT.row_key			
       JOIN #DWH_TABLE_SCHEMA.d_lov_map br 
         ON (SRC.review_status = br.dimension_code and f.source_id=br.source_id 
            )
WHERE   br.dimension_class = 'REVIEW_STATUS~CHANGE_REQUEST' AND
CASE 
         WHEN br.dimension_wh_code = 'FAIL' 
               THEN 'Y' 
         ELSE 'N' 
       END <> TRGT.failure_flag)temp;

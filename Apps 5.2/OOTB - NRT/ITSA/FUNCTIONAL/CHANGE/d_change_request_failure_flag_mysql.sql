SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, 
 CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_change_request.failure_flag' ELSE 'SUCCESS' END AS Message
FROM (SELECT count(1) as CNT
FROM   <<tenant>>_mdsdb.change_request_final SRC 
        JOIN <<tenant>>_mdwdb.d_change_request TRGT 
              ON ( SRC.sys_id = TRGT.row_id 
                   AND SRC.sourceinstance = TRGT.source_id )
			JOIN <<tenant>>_mdwdb.f_change_request f
on f.change_request_key=TRGT.row_key			
       JOIN <<tenant>>_mdwdb.d_lov_map br 
         ON (SRC.review_status = br.dimension_code and f.source_id=br.source_id 
            )
			left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and   br.dimension_class = 'REVIEW_STATUS~CHANGE_REQUEST' AND
CASE 
         WHEN br.dimension_wh_code = 'FAIL' 
               THEN 'Y' 
         ELSE 'N' 
       END <> TRGT.failure_flag)temp;

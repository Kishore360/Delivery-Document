
SELECT
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_change_request.rescheduled_flag' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
FROM (select * from <<tenant>>_mdsdb.change_request_final where cdctype<>'D') SRC
 LEFT JOIN <<tenant>>_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

  JOIN <<tenant>>_mdwdb.f_change_request TRGT1 

ON (SRC.sys_id =TRGT1.row_id  
 AND SRC.sourceinstance= TRGT1.source_id  )  
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and (case when TRGT1.reschedule_count>0  then 'Y' else 'N' end) <>(TRGT.rescheduled_flag))temp;
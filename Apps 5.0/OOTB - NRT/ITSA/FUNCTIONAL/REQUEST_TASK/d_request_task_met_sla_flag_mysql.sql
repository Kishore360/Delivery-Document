SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_task.met_sla_flag' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM (select * from <<tenant>>_mdsdb.sc_task_final where cdctype<>'D') SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (src.cdctime<=f1.lastupdated) and ( CASE WHEN SRC.made_sla =1 then 'Y' else 'N' END)<> (TRGT.met_sla_flag ))temp;
 

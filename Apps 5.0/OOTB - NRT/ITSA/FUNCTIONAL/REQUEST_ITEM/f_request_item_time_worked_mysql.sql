SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.time_worked' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 (select * from <<tenant>>_mdsdb.sc_req_item_final cdctype<>'D') SRC
 LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
WHERE (SRC.cdctime<=f1.lastupdated) and  TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.time_worked)<>  COALESCE(TRGT.time_worked,''))temp;


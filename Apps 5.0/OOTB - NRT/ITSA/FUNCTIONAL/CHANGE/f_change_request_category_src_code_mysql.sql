

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.category_src_code' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 
 FROM (select * from <<tenant>>_mdsdb.change_request_final where cdctype<>'D') SRC 

 inner JOIN <<tenant>>_mdwdb.f_change_request TRGT 

 

 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and coalesce( SRC.category,'')<> coalesce(TRGT.category_src_code,''))temp; 

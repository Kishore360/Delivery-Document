SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.state_src_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 (select * from <<tenant>>_mdsdb.sc_req_item_final cdctype<>'D') SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id AND TRGT.soft_deleted_flag ='N'   )
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( concat('STATE','~','SC_REQ_ITEM','~','~','~',upper(state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 WHERE (SRC.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key))temp;
 

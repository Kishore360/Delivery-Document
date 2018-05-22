SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 
 (select * from <<tenant>>_mdsdb.sc_req_item_final cdctype<>'D') SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id AND TRGT.soft_deleted_flag = 'N'   )
  JOIN  <<tenant>>_mdwdb.f_request_item TRGTF 
 ON (TRGTF.request_item_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id AND TRGTF.soft_deleted_flag = 'N')
  LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key and LM.dimension_class='STATE~SC_REQ_ITEM'
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
WHERE (SRC.cdctime<=f1.lastupdated) and ( CASE WHEN LM.dimension_wh_code IN ('OPEN') THEN 'Y' ELSE 'N' END)<> (TRGT.backlog_flag)) temp;





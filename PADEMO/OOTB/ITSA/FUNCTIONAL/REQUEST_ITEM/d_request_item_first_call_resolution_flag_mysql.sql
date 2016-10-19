/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.first_call_resolution_flag' ELSE 'SUCCESS' END as Message FROM(
 SELECT CASE WHEN  TIMESTAMPDIFF(MINUTE,SRC.opened_at,coalesce(SRC.closed_at,SRC.sys_updated_on))<30
 THEN 'Y' ELSE 'N' END ABC , (TRGT.first_call_resolution_flag ) DEF
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC 
  JOIN <<tenant>>_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN <<tenant>>_mdwdb.f_request_item TRGTF 
 ON (SRC.sys_id =TRGTF.row_id  
 AND SRC.sourceinstance= TRGTF.source_id  )
  JOIN <<tenant>>_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key AND LM.dimension_class = 'STATE~SC_REQ_ITEM'
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED')
 
where TIMESTAMPDIFF(MINUTE,SRC.opened_at,coalesce(SRC.closed_at,SRC.sys_updated_on))<30
)A
 WHERE  ABC<>DEF

 

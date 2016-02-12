SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.first_call_resolution_flag' ELSE 'SUCCESS' END as Message FROM(
 SELECT CASE WHEN  TIMESTAMPDIFF(MINUTE,TRGT.opened_on,TRGT.closed_on)<30
 THEN 'Y' ELSE 'N' END ABC , (TRGT.first_call_resolution_flag ) DEF
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 
where TIMESTAMPDIFF(MINUTE,TRGT.opened_on,TRGT.closed_on)<30
)A
 WHERE  ABC<>DEF

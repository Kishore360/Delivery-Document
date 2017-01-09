
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (SELECT count(1) as cnt
 FROM nbcu_mdsdb.sc_task_final SRC
 LEFT JOIN nbcu_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id ) =(TRGT.row_id ) 
 AND (SRC.sourceinstance )=(TRGT.source_id ) 
 left join nbcu_mdsdb.sc_req_item_final ri
 on  ri.sys_id=SRC.request_item
 LEFT JOIN nbcu_mdwdb.d_lov LKP 
 ON (CONCAT('STATE~SC_REQ_ITEM~~~',UPPER(ri.state)))= (LKP.src_rowid )
 AND SRC.sourceinstance= LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN ri.state IS NULL THEN 0 else -1 end)<> (TRGT.req_item_state_src_c_key) ;


SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_problem.severity_src_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
-- select COALESCE(LKP.row_key,CASE WHEN SRC.severity IS NULL THEN 0 else -1 end), (TRGT.severity_src_c_key)
 FROM ibmwatson_mdsdb.sc_req_item_ext_final SRC 
 join ibmwatson_mdsdb.sc_req_item_final b on b.sys_id=SRC.record_id  and SRC.sourceinstance=2 
  JOIN ibmwatson_mdwdb.d_request_item TRGT 
 ON (b.sys_id =TRGT.row_id  
 AND b.sourceinstance= TRGT.source_id) and b.cdctype<>'D'
LEFT JOIN ibmwatson_mdwdb.d_lov LKP 
 ON ( concat('SEVERITY','~','SC_REQ_ITEM','~',upper(severity))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.severity IS NULL THEN 0 else -1 end)<> (TRGT.severity_src_c_key)
 
 )b

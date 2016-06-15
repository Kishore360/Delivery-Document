SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.category_src_key' ELSE 'SUCCESS' END as Message from (
select count(1) as cnt   
FROM nbcu_mdsdb.new_call_final SRC 
LEFT JOIN nbcu_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%CALL_TYPE~CALL%' and
  concat('CALL_TYPE~CALL~~~',upper(call_type ))=  LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 LEFT JOIN nbcu_mdwdb.f_call TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.call_type IS NULL THEN 0 else -1 end)<> (TRGT.call_type_src_key))a
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM gogo_mdsdb.wm_order_final SRC 
 LEFT JOIN gogo_mdwdb.f_work_order_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN gogo_mdwdb.d_lov LKP 
 ON  LKP.dimension_class like '%STATE~TASK%' and
( concat('STATE~TASK~~~',upper(SRC.state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key)
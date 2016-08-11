SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.row_id' ELSE 'SUCCESS' END as Message
 FROM gogo_mdsdb.wm_order_final SRC 
 LEFT JOIN gogo_mdwdb.d_work_order_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.number)<> COALESCE(TRGT.wo_number)
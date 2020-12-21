SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ama_inventory_c_fact.opened_on_key' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_ama_processing_activity_inventory_c_final  SRC 
JOIN png_jul_mdwdb.f_ama_inventory_c_fact TRGT ON (SRC.inventory_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN png_jul_mdwdb.d_calendar_date LKP ON DATE_FORMAT(str_to_date(SRC.creation_date,'%Y-%m-%d %H:%i:%s'),'%Y%m%d') = LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.creation_date IS NULL THEN 0 else -1 end)<> (TRGT.opened_on_key) 

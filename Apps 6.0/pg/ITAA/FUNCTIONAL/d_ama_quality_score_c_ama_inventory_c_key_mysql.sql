SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ama_quality_score_c.ama_inventory_c_key' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_ama_quality_score_c_final  SRC 
INNER JOIN png_mdsdb.pg_ot_ama_processing_activity_inventory_c_final ama_processing_activity_inventory_c  ON 1=1 
INNER JOIN png_mdwdb.d_ama_quality_score_c TRGT ON (concat(ama_processing_activity_inventory_c.inventory_id,'~',SRC.Rule_ID) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
LEFT JOIN png_mdwdb.d_ama_inventory_c LKP ON ( ama_processing_activity_inventory_c.inventory_id = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN ama_processing_activity_inventory_c.inventory_id IS NULL THEN 0 else -1 end)<> (TRGT.ama_inventory_c_key) 


SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ama_quality_score_c.description_c' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_ama_quality_score_c_final  SRC 
INNER JOIN png_mdsdb.pg_ot_ama_processing_activity_inventory_c_final ama_processing_activity_inventory_c  ON 1=1 
INNER JOIN png_jul_mdwdb.d_ama_quality_score_c TRGT ON (concat(ama_processing_activity_inventory_c.inventory_id,'~',SRC.Rule_ID) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE SRC.Description <> (TRGT.description_c) and SRC.cdctype='X' 

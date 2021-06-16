SELECT CASE WHEN Count(1) > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN Count(1) > 0  THEN 'MDS to DWH data validation failed for d_ama_inventory_c.reasonable_infosec_criteria_c' ELSE 'SUCCESS' END as Message FROM png_mdsdb.pg_ot_ama_processing_activity_inventory_c_final  SRC JOIN png_mdwdb.d_ama_inventory_c TRGT ON (SRC.inventory_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.reasonable_infosec_criteria <> (TRGT.reasonable_infosec_criteria_c) and SRC.cdctype='X' 

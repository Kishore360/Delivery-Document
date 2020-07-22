SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ama_inventory_c.notice_status_c' ELSE 'SUCCESS' END as Message FROM png_mdsdb.pg_ot_ama_processing_activity_inventory_c_final  SRC JOIN png_jul_mdwdb.d_ama_inventory_c TRGT ON (SRC.inventory_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.notice_status <> (TRGT.notice_status_c) and SRC.cdctype='X' 

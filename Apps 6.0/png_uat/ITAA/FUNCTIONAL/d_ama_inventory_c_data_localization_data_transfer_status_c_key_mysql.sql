SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ama_inventory_c.data_localization_data_transfer_status_c_key' ELSE 'SUCCESS' END as Message FROM png_mdsdb.pg_ot_ama_processing_activity_inventory_c_final  SRC JOIN png_jul_mdwdb.d_ama_inventory_c TRGT ON (SRC.inventory_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN png_jul_mdwdb.d_lov LKP ON ( concat( 'OT_AMA_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~' ,upper( SRC.data_localization_data_transfer_status)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.data_localization_data_transfer_status IS NULL THEN 0 else -1 end)<> (TRGT.data_localization_data_transfer_status_c_key) 

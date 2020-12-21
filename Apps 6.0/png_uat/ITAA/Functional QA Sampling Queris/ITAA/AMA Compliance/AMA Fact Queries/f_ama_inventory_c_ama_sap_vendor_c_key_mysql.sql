SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ama_inventory_c_fact.ama_sap_vendor_c_key' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_ama_processing_activity_inventory_c_final  SRC 
JOIN png_jul_mdwdb.f_ama_inventory_c_fact TRGT ON (SRC.inventory_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN png_jul_mdwdb.d_internal_organization LKP ON COALESCE(CONCAT( 'OT_AMA_VENDOR~',sha1(lower(SRC.sap_vendor_name))),'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance = LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sap_vendor_name IS NULL THEN 0 else -1 end)<> (TRGT.ama_sap_vendor_c_key) 

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_brazil_inventory_c.Recipients_of_the_data_c' ELSE 'SUCCESS' END as Message FROM png_mdsdb.pg_ot_brazil_processing_activity_inventory_c_final  SRC JOIN png_mdwdb.d_brazil_inventory_c TRGT ON (SRC.Inventory_Id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.Recipients_of_the_data <> (TRGT.Recipients_of_the_data_c) 

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_brazil_inventory_c.Lawfulness_Basis_Criteria_c' ELSE 'SUCCESS' END as Message FROM png_mdsdb.pg_ot_brazil_processing_activity_inventory_c_final  SRC JOIN png_mdwdb.d_brazil_inventory_c TRGT ON (SRC.Inventory_Id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.Lawfulness_Basis_Criteria <> (TRGT.Lawfulness_Basis_Criteria_c) 

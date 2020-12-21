SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_brazil_inventory_c.vendors_scope_c' ELSE 'SUCCESS' END as Message FROM png_mdsdb.pg_ot_brazil_processing_activity_inventory_c_final  SRC JOIN png_mdwdb.d_brazil_inventory_c TRGT ON (SRC.Inventory_Id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE CASE 
                    WHEN (((COALESCE(SRC.Vendor_Qualification,
                    'UNSPECIFIED') = 'DATA PROCESSOR' 
                    or (COALESCE(SRC.Vendor_Qualification,
                    'UNSPECIFIED') = 'TO BE CLARIFIED')       
                    or  COALESCE(SRC.Vendor_Qualification,
                    'UNSPECIFIED')='UNSPECIFIED')  
                    AND  (SRC.Vendor_involved='TRUE' 
                    or SRC.Vendor_involved=1))) then 'TRUE'     
                    WHEN (SRC.Vendor_involved='FALSE' 
                    or SRC.Vendor_involved=0)  then 'FALSE'   
                    else 'FALSE' 
                end <> (TRGT.vendors_scope_c) 
				
				
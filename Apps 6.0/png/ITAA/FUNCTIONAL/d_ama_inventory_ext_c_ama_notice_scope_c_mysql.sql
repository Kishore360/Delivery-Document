SELECT CASE WHEN Count(1) > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN Count(1) > 0  THEN 'MDS to DWH data validation failed for d_ama_inventory_ext_c.notice_scope_c' ELSE 'SUCCESS' END as Message
 FROM png_mdsdb.pg_ot_ama_processing_activity_inventory_c_final  SRC 
 JOIN png_mdwdb.d_ama_inventory_ext_c TRGT ON (SRC.inventory_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
 WHERE SRC.cdctype<>'D' AND (CASE 
                    WHEN (((SRC.vendor_qualification = 'DATA CONTROLLER') ) 
                    AND (SRC.vendor_involved='TRUE' 
                    or SRC.vendor_involved=1)) then 'FALSE'   
                    WHEN (((COALESCE(SRC.vendor_qualification,
                    'UNSPECIFIED') = 'DATA PROCESSOR'  
                    or  (COALESCE(SRC.vendor_qualification,
                    'UNSPECIFIED') = 'TO BE CLARIFIED')  
                    or  COALESCE(SRC.vendor_qualification,
                    'UNSPECIFIED')='UNSPECIFIED' ) 
                    AND (SRC.vendor_involved='TRUE' 
                    or SRC.vendor_involved=1))) then 'TRUE'    
                    WHEN (SRC.vendor_involved='FALSE' 
                    or SRC.vendor_involved=0 
                    OR SRC.vendor_involved is NULL) then 'TRUE' 
                    else 'FALSE' 
                end) <> (TRGT.notice_scope_c);
				
				
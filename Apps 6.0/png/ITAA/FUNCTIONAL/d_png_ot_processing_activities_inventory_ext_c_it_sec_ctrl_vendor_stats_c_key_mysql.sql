
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_ext_c.it_sec_ctrl_vendor_stats_c_key' ELSE 'SUCCESS' END as Message 
 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  SRC 
JOIN png_mdwdb.d_png_ot_processing_activities_inventory_ext_c TRGT ON 
SRC.Inventory_Id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
LEFT OUTER JOIN png_mdwdb.d_lov LKP 
ON   CONCAT('OT_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',CASE 
                    WHEN SRC.Reasonable_InfoSec_Vendor_Status    ='' THEN NULL                      
                    WHEN UPPER(SRC.Reasonable_InfoSec_Vendor_Status ) IN ('DEVIATION FROM CENTRAL SCOPE',
                    'Aligned deviation from Central SCOPE') THEN 'ALIGNED DEVIATION FROM CENTRAL SCOPE'                      
                    ELSE UPPER(SRC.Reasonable_InfoSec_Vendor_Status )                  
                END) = LKP.row_id and LKP.source_id =  SRC.sourceinstance

WHERE  CASE WHEN SRC.Reasonable_InfoSec_Vendor_Status IS NULL THEN 0 ELSE COALESCE(LKP.row_key,-1) END  <> (TRGT.it_sec_ctrl_vendor_stats_c_key) and TRGT.soft_deleted_flag ='N';



SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_ext_c_it_sec_ctrl_vendor_scope_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  SRC 
JOIN png_mdwdb.d_png_ot_processing_activities_inventory_ext_c TRGT ON 
SRC.Inventory_Id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
WHERE IF(Vendor_Qualification ='DATA PROCESSOR','TRUE','FALSE')  <> (TRGT.it_sec_ctrl_vendor_scope_c) and TRGT.soft_deleted_flag ='N'
) temp;
 

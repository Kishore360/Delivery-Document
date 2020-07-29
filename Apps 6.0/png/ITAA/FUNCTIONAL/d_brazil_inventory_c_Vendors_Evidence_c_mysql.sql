SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_brazil_inventory_c.Vendors_Evidence_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_brazil_processing_activity_inventory_c_final  SRC 
LEFT JOIN png_mdwdb.d_brazil_inventory_c TRGT ON (SRC.Inventory_Id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE SRC.Vendors_Evidence <> (TRGT.Vendors_Evidence_c) 
AND SRC.cdctype='X'
)


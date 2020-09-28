SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_brazil_inventory_c.inventory_id_c' ELSE 'SUCCESS' END as Message 
(
Select Count(1) as CNT 
FROM png_mdsdb.pg_ot_brazil_processing_activity_inventory_c_final  SRC 
LEFT JOIN png_mdwdb.d_brazil_inventory_c TRGT ON (SRC.Inventory_Id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE SRC.Inventory_Id <> (TRGT.inventory_id_c) 
AND SRC.cdctype='X' 
)


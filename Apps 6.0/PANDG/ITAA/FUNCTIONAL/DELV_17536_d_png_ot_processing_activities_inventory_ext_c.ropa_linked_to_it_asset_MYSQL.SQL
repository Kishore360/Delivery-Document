
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_ext_c.ropa_linked_to_it_asset' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  SRC 
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_ext_c TRGT ON SRC.Inventory_Id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(CASE 
WHEN SRC.RoPA_linked_to_IT_Asset = 'YES' OR SRC.RoPA_linked_to_IT_Asset ='yes' OR SRC.RoPA_linked_to_IT_Asset ='Y' THEN 'Y'
WHEN SRC.RoPA_linked_to_IT_Asset = 'No' OR SRC.RoPA_linked_to_IT_Asset ='no' OR SRC.RoPA_linked_to_IT_Asset ='N' THEN 'N'
ELSE 'X' END )<>TRGT.ropa_linked_to_it_asset
AND SRC.cdctype='X'

) temp;



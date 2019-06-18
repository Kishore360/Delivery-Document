SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_ext_c.asset_name' ELSE 'SUCCESS' END as Message
FROM 
(
 
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  SRC 
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_ext_c TRGT ON SRC.Inventory_Id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.Asset_Name,'UNSPECIFIED')<>TRGT.asset_name
AND SRC.cdctype='X'
) temp;




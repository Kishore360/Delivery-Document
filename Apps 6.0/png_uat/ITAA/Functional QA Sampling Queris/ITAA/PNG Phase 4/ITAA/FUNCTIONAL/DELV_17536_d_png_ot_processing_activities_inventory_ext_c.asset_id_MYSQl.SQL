SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_ext_c.asset_id' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT a.Inventory_Id,a.sourceinstance,GROUP_CONCAT(Distinct a.Asset_Id) AS Asset_Id,a.cdctype
FROM png_mdsdb.pg_ot_processing_activities_inventory_final a 
Group by 1,2
) SRC 
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_ext_c TRGT ON SRC.Inventory_Id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.Asset_Id,'UNSPECIFIED')<>TRGT.asset_Id
AND SRC.cdctype='X'
) temp;




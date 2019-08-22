SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.adm_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_c TRGT ON SRC.Inventory_Id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.adm,'UNSPECIFIED')<>TRGT.adm_flag
AND SRC.cdctype='X'
)temp;


  
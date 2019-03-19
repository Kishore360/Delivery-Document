SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.health_info' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_c TRGT ON SRC.inventory_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id AND SRC.cdctype<>'D'
WHERE 
(CASE WHEN SRC.Data_Elements_Collected_PG LIKE '%Protected Health Information (“PHI”)%' THEN 'TRUE' ELSE 'FALSE' END)<>TRGT.health_info
) temp;
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.priv_imp_asmt_criteria' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_c TRGT ON SRC.Inventory_Id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  
IF(SRC.DPIA_Criteria IS NOT NULL AND SRC.DPIA_Criteria <>'',SRC.DPIA_Criteria, 'UNSPECIFIED') 
<>TRGT.priv_imp_asmt_criteria
AND SRC.cdctype='X'
)temp;


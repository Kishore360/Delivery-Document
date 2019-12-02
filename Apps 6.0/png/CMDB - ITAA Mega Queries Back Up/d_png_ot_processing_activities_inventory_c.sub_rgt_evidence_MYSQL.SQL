SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.sub_rgt_evidence' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_c TRGT ON SRC.Inventory_Id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  
IF(SRC.Data_Subject_Rights_Evidence IS NOT NULL  AND SRC.Data_Subject_Rights_Evidence <>'',
SRC.Data_Subject_Rights_Evidence, 'UNSPECIFIED') 
<>TRGT.sub_rgt_evidence
AND SRC.cdctype='X'
)temp;




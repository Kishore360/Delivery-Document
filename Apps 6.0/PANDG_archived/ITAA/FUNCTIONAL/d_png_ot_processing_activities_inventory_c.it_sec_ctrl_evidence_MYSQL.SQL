SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.it_sec_ctrl_evidence' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_c TRGT ON SRC.Inventory_Id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Reasonable_InfoSec_Evidence IS NOT NULL  AND SRC.Reasonable_InfoSec_Evidence <>'',SRC.Reasonable_InfoSec_Evidence,'UNSPECIFIED')
<>TRGT.it_sec_ctrl_evidence
AND SRC.cdctype='X'
)temp;

 
 

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_ccpa_quality_score_c.weightage_c' ELSE 'SUCCESS' END as Message
FROM 
(
 SELECT Count(1) as CNT 
 FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
 LEFT JOIN png_mdsdb.pg_ot_ccpa_quality_score_c_final SRC1 ON 1=1
 LEFT JOIN png_mdwdb.d_ccpa_quality_score_c TRGT ON CONCAT(SRC.ID,'~',SRC1.Rule_ID)=TRGT.row_id
 WHERE SRC1.Weightage<>TRGT.weightage_c
 AND SRC.cdctype='X'
) temp;


 

 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_ccpa_quality_score_c.short_message_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
 SELECT Count(1) as CNT 
 FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
 LEFT JOIN png_mdsdb.pg_ot_ccpa_quality_score_c_final SRC1 ON 1=1
 LEFT JOIN png_mdwdb.d_ccpa_quality_score_c TRGT ON CONCAT(SRC.ID,'~',SRC1.Rule_ID)=TRGT.row_id
 LEFT JOIN png_mdwdb.d_lov LKP ON CONCAT('OT_CCPA_QUALITY_MESSAGE_C~PROCESSING_ACTIVITIES','~',replace(replace(SRC1.Message,'}', ''),'{',''))=LKP.row_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.Message IS NULL THEN 0 ELSE -1 END) <> TRGT.short_message_c_key
 AND SRC.cdctype='X'
) temp;


 
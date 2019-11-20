SELECT 
CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.ccpa_notice_status_c_key'
 ELSE 'SUCCESS ccpa_notice_status_c_key' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN png_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',src.Notice_Status),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Notice_Status IS NULL THEN 0 else -1 end)<> trgt.ccpa_notice_status_c_key;


 
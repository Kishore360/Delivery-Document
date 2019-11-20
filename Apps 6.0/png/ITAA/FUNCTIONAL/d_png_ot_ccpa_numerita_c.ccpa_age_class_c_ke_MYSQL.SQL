SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS ' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.ccpa_age_class_c_key' 
ELSE 'SUCCESS  ccpa_age_class_c_key' END as Message
FROM 
(
Select Count(1) as CNT
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC join
pgrita_mdwdb.d_png_ot_ccpa_numerita_c a11 on a11.row_id=SRC.ID
JOIN pgrita_workdb.d_o_data_freshness a12 ON a11.source_id = a12.source_id -- AND a12.etl_run_number = 0
LEFT JOIN pgrita_mdwdb.d_lov lv_age ON lv_age.dimension_class='WH_OT_CCPA_AGE_CLASS_C~PROCESSING_ACTIVITIES'
 AND timestampdiff(DAY,a11.created_on,convert_tz(a12.lastupdated,'GMT','America/New_York')) 
 BETWEEN lv_age.lower_range_value and lv_age.upper_range_value

WHERE a11.ccpa_age_class_c_key IS NULL OR a11.ccpa_age_class_c_key <> lv_age.row_key
 ) temp;
 
 
 
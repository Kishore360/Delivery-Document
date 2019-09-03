SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.ot_age_class_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT
FROM  png_mdwdb.d_png_ot_processing_activities_inventory_c a11
JOIN (Select x.source_id,max(x.lastupdated) as Lastupdated 
FROM png_mdwdb.d_o_data_freshness x  group by source_id)  a12 ON a11.source_id = a12.source_id 
LEFT JOIN png_mdwdb.d_lov lv_age ON lv_age.dimension_class = 'WH_OT_AGE_CLASS_C~PROCESSING_ACTIVITIES'
AND timestampdiff(DAY,a11.created_on,convert_tz(a12.lastupdated,'GMT','America/New_York')) BETWEEN lv_age.lower_range_value and lv_age.upper_range_value
WHERE a11.ot_age_class_c_key IS NULL OR a11.ot_age_class_c_key <> lv_age.row_key 
)temp;




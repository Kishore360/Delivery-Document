SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.ccpa_age_class_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a 
LEFT JOIN 
(Select x.source_id,max(x.lastupdated) as Lastupdated 
FROM png_mdwdb.d_o_data_freshness x  group by source_id) x ON a.sourceinstance=x.source_id
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c b ON a.ID=b.row_id AND a.sourceinstance=b.source_id
JOIN pgrita_mdwdb.d_lov LKP ON LKP.dimension_class='WH_OT_CCPA_AGE_CLASS_C~PROCESSING_ACTIVITIES'
AND timestampdiff(DAY,a.Created,convert_tz(x.lastupdated,'GMT','America/New_York')) 
BETWEEN LKP.lower_range_value and LKP.upper_range_value
WHERE COALESCE(LKP.row_key, CASE WHEN a.Created IS NULL THEN 0 ELSE -1 END)<>b.ccpa_age_class_c_key
AND a.cdctype='X'
) temp;




SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.life_cycle_status_c_key' ELSE 'SUCCESS Life_Cycle_Status' 
END as Message 
FROM 
( 
SELECT Count(1) as CNT 
FROM  png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pgrita_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_LIFE_CYCLE_STATUS_C~PROCESSING_ACTIVITIES~',src.Life_Cycle_Status),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Life_Cycle_Status IS NULL THEN 0 else -1 end)<> trgt.ot_ccpa_life_cycle_status_c_key
) temp;



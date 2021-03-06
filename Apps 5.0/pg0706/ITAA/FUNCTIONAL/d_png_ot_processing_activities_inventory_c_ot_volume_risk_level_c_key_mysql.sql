SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.ot_volume_risk_level_c_key' ELSE 'SUCCESS' END as Message 
FROM
(SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  png_mdwdb.d_png_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN png_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_VOLUME_RISK_LEVEL_C~PROCESSING_ACTIVITIES~',src.Risk_Level),'UNSPECIFIED') =lkp.row_id
AND src.sourceinstance=lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.Risk_Level IS NULL THEN 0 else -1 end)<>trgt.ot_volume_risk_level_c_key
) temp;

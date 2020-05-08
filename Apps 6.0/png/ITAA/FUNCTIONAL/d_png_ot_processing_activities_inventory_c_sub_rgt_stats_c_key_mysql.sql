SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.sub_rgt_stats_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM  png_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  png_mdwdb.d_png_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN png_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',src.Data_Subject_Rights_Status),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Data_Subject_Rights_Status IS NULL THEN 0 else -1 end)<> trgt.sub_rgt_stats_c_key
AND src.cdctype='X'
)temp;




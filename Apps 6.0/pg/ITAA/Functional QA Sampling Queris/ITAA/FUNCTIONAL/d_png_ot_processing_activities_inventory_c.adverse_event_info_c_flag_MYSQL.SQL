SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS adverse_event_info_c_flag' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.adverse_event_info_c_flag' ELSE 'SUCCESS' END as Message 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  png_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
where COALESCE(src.Adverse_Event_Information,'UNSPECIFIED') <> trgt.adverse_event_info_c_flag
) temp;




 
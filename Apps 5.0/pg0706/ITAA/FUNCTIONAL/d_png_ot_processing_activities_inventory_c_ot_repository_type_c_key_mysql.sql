SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.ot_repository_type_c_key' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  png_mdwdb.d_png_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN png_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_PA_REPOSITORY_TYPE_C~PROCESSING_ACTIVITIES~',src.Processing_Activity_Repository_Type),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Processing_Activity_Repository_Type IS NULL THEN 0 else -1 end)<> trgt.ot_repository_type_c_key
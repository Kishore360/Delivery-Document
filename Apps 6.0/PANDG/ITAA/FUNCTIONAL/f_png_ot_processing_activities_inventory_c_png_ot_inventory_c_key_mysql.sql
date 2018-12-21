SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for f_png_ot_processing_activities_inventory_c.png_ot_inventory_c_key' 
ELSE 'SUCCESS' END as Message 
FROM pandg_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  pandg_mdwdb.f_png_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pandg_mdwdb.d_png_ot_processing_activities_inventory_c lkp
ON COALESCE(src.inventory_id,'UNSPECIFIED')=lkp.row_id and trgt.source_id=lkp.source_id
where COALESCE(lkp.row_key,case when src.inventory_id is NULL THEN 0 ELSE -1 END)<>trgt.png_ot_inventory_c_key;
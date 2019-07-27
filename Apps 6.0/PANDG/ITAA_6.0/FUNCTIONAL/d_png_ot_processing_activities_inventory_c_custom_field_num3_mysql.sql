SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.custom_field_num3' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  png_mdwdb.d_png_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
where case when src.Custom_Field_num3 IS NULL or src.Custom_Field_num3 = ''
      then 'UNSPECIFIED'  else src.Custom_Field_num3 end <> trgt.custom_field_num3
SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.pg_sites_departments' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  png_mdwdb.d_png_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
where case when src.PG_Sites_Departments IS NULL or src.PG_Sites_Departments = ''
      then 'UNSPECIFIED'  else src.PG_Sites_Departments end <> trgt.pg_sites_departments
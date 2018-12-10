SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.processing_activity_linked_to_pg_system' ELSE 'SUCCESS' END as Message 
FROM pandg_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  pandg_mdwdb.d_png_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
where case when src.Processing_Activity_Linked_to_PG_System IS NULL or src.Processing_Activity_Linked_to_PG_System = ''
      then 'UNSPECIFIED'  else src.Processing_Activity_Linked_to_PG_System end <> trgt.linked_to_pg_system
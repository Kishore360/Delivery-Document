SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.transfer_to_3rd_countries_details' ELSE 'SUCCESS' END as Message 
FROM pandg_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  pandg_mdwdb.d_png_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
where case when src.transfer_to_3rd_countries_details IS NULL or src.transfer_to_3rd_countries_details = ''
      then 'UNSPECIFIED'  else src.transfer_to_3rd_countries_details end <> trgt.transfer_to_3rd_countries_details
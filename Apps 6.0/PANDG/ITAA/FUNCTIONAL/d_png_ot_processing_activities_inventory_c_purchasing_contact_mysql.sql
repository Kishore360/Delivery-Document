SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_pandg_ot_processing_activities_inventory_c.purchasing_contact' ELSE 'SUCCESS' END as Message 
FROM pandg_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  pandg_mdwdb.d_pandg_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
where case when src.purchasing_contact IS NULL or src.purchasing_contact = ''
      then 'UNSPECIFIED'  else src.purchasing_contact end <> trgt.purchasing_contact
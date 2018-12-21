SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_pandg_ot_processing_activities_inventory_c.third_party_contact' ELSE 'SUCCESS' END as Message 
FROM pandg_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  pandg_mdwdb.d_pandg_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
where case when src.third_party_contact IS NULL or src.third_party_contact = ''
      then 'UNSPECIFIED'  else src.third_party_contact end <> trgt.third_party_contact
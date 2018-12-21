SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_pandg_ot_processing_activities_inventory_c.ot_eu_data_stakeholders_c_key' ELSE 'SUCCESS' END as Message 
FROM pandg_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  pandg_mdwdb.d_pandg_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pandg_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_EU_DATA_STAKEHOLDERS~PROCESSING_ACTIVITIES~',
src.num_of_Data_Stakeholders_from_EU),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.num_of_Data_Stakeholders_from_EU IS NULL THEN 0 else -1 end)<> trgt.ot_eu_data_stakeholders_c_key



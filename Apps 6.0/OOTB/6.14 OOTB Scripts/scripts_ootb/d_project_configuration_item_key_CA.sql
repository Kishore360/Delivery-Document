SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM (select * from  #DWH_TABLE_SCHEMA.d_project) TRGT 
where COALESCE(TRGT.configuration_item_key,'0') <> 0



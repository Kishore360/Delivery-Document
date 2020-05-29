SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM (select * from  #DWH_TABLE_SCHEMA.f_project) TRGT 
where COALESCE(TRGT.assigned_to_key,'0') <> 0



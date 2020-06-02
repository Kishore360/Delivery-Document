SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.company_key' ELSE 'SUCCESS' END as Message
FROM (select * from  #DWH_TABLE_SCHEMA.f_project) TRGT 
where COALESCE(TRGT.company_key,'0') <> 0



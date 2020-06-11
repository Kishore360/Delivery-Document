SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.BUSINESS_SERVICE_KEY' ELSE 'SUCCESS' END as Message
FROM (select * from #DWH_TABLE_SCHEMA.f_project where  row_key not in (0,-1))TRGT   
where TRGT.BUSINESS_SERVICE_KEY<> '0'
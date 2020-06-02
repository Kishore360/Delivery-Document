SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.subsidiary' ELSE 'SUCCESS' END as Message
FROM (select * from   #DWH_TABLE_SCHEMA.d_project)TRGT   
where TRGT.subsidiary <> null
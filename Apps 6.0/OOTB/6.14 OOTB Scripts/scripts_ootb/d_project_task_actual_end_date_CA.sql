SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.actual_end_date' ELSE 'SUCCESS' END as Message
FROM (select * from #DWH_TABLE_SCHEMA.d_project_task)TRGT   
where  TRGT.actual_end_date<> null



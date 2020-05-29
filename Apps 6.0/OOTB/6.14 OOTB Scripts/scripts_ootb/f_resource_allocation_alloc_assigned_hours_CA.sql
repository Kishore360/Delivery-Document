SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.assigned_hours' ELSE 'SUCCESS' END as Message
FROM (select * from  #DWH_TABLE_SCHEMA.f_resource_allocation where row_id like 'ALLOCATION%' )TRGT   
where  TRGT.assigned_hours<> null
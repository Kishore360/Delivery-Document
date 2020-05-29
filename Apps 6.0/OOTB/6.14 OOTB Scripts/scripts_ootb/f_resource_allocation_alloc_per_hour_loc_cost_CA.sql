SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.per_hour_loc_cost' ELSE 'SUCCESS' END as Message
FROM (select * from  #DWH_TABLE_SCHEMA.f_resource_allocation)TRGT   
where  TRGT.per_hour_loc_cost<> null
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.allocated_doc_cost' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_allocation_final WHERE CDCTYPE<>'D') SRC
left join 
(select distinct SUBSTRING_INDEX(row_id,'~',1) as source_row_id, resource_plan_key, project_key, resource_key, F.week_day_count, F.allocated_doc_cost 
from #DWH_TABLE_SCHEMA.f_resource_allocation F
-- group by SUBSTRING_INDEX(row_id,'~',1) , resource_plan_key, project_key, resource_key, F.week_day_count
)TRGT
on TRGT.source_row_id = SRC.sys_id
join ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_plan_final WHERE CDCTYPE<>'D')  RP        
ON SRC.resource_plan = RP.sys_id   AND   SRC.sourceinstance = RP.sourceinstance
LEFT JOIN ( select * from #MDS_TABLE_SCHEMA.fx_currency_instance_final where (id, sys_created_on,field) in ( select id, max(sys_created_on),field from #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D' and upper(field)='ALLOCATED_COST' and (id is not null) group by id, sys_created_on,field)) FX1  
ON (FX1.id = RP.sys_id 
AND FX1.sourceinstance = SRC.sourceinstance 
AND upper(FX1.field )= 'ALLOCATED_COST')
where round((TRGT.week_day_count * TRGT.allocated_doc_cost), 0) <> round(SRC.allocated_cost, 0);
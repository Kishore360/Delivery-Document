SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.assigned_doc_cost' ELSE 'SUCCESS' END as Message
 from (select SUBSTRING_INDEX(row_id,'~',1) as source_row_id, resource_plan_key, project_key, resource_key,(sum(distinct F.assigned_doc_cost) *F.week_day_count) as assigned_doc_cost 
from #DWH_TABLE_SCHEMA.f_resource_allocation F
group by SUBSTRING_INDEX(row_id,'~',1) , resource_plan_key, project_key, resource_key
)TRGT
join ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_allocation_final WHERE CDCTYPE<>'D') SRC
on TRGT.source_row_id = SRC.sys_id
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_plan_final WHERE CDCTYPE<>'D')  RP        
ON SRC.resource_plan = RP.sys_id   AND   SRC.sourceinstance = RP.sourceinstance
WHERE COALESCE( CAST(coalesce(SRC.assigned_cost,0) as decimal(20,10)),'')<> COALESCE(cast(round(TRGT.assigned_doc_cost) as decimal(20,10)),'');
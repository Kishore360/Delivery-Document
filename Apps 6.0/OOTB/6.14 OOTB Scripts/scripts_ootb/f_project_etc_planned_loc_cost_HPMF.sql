SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project.etc_planned_loc_cost' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype <> 'D') SRC
left join #DWH_TABLE_SCHEMA.d_project d_pro
on d_pro.row_id=SRC.project_id
and d_pro.source_id=SRC.sourceinstance
left join
(select project_key,proj_cost.source_id,sum(estimated_doc_cost) as project_planned_cost 
from #DWH_TABLE_SCHEMA.f_project_cost proj_cost
left join #DWH_TABLE_SCHEMA.d_calendar_date d_cal
on proj_cost.calendar_date_key=d_cal.row_key
and d_cal.source_id=0
where d_cal.lagging_count_of_days<0
group by 1,2)project_cost
on d_pro.row_key=project_cost.project_key
and d_pro.source_id=project_cost.source_id
left join #DWH_TABLE_SCHEMA.f_project TRGT
on TRGT.project_key=project_cost.project_key
and TRGT.source_id=project_cost.source_id
where coalesce(TRGT.etc_planned_loc_cost,'')<>0;
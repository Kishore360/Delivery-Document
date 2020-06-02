drop table if exists #STG_TABLE_SCHEMA.f_work_item_curr_snpst_mnth_base;

create table #STG_TABLE_SCHEMA.f_work_item_curr_snpst_mnth_base
select F.work_item_key,
F.age_since_creation,
D.work_item_assigned_to_key as assigned_to_key,
F.cdctype,
F.changed_by,
F.changed_on,
F.created_by,
F.created_on,
D.due_on as due_date,
D.work_start_on as in_progress_date,
D.in_progress_flag,
D.work_item_updated_on as last_updated_date,
CAL.month_start_date as n_date,
CAL.month_start_date_key as n_key,
D.overdue_flag,
F.project_key,
D.proposed_flag,
F.reassignment_count,
F.reopen_count,
D.reopened_flag,
D.resolved_on as resolved_date,
F.row_id,
F.soft_deleted_flag,
F.source_id,
D.short_description as summary,
D.earliest_fixed_version_key as work_item_earliest_fixed_version_key,
D.iteration_key as work_item_iteration_key,
D.work_item_priority_src_key, 
D.work_item_status_src_key
from #DWH_TABLE_SCHEMA.f_work_item F
left join  #DWH_TABLE_SCHEMA.d_work_item D
ON F.work_item_key = D.row_key
left join (
select source_id, max(lastupdated) as last_updated
from #DWH_TABLE_SCHEMA.d_o_data_freshness 
where sourcename = 'Jira_Tenant' group by source_id) ODF 
on ODF.source_id = F.source_id
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON (date_format(ODF.last_updated,'%Y%m%d') = CAL.row_id);
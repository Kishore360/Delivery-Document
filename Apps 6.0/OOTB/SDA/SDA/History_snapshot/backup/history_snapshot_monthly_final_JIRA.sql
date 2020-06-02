drop table if exists #STG_TABLE_SCHEMA.history_snapshot_monthly_temp_bkp;

create table #STG_TABLE_SCHEMA.history_snapshot_monthly_temp_bkp
select * from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp;

drop table if exists #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base;

create table #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base

select D.row_key as work_item_key,
SRC.age_since_creation as age_since_creation,
coalesce(ASGN.row_key, case when SRC.assignee is null then 0 else -1 end) as assigned_to_key,
SRC.cdctype as cdctype,
SRC.changed_by as changed_by,
coalesce(SRC.changed_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as changed_on,
SRC.created_by as created_by,
coalesce(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as created_on,
SRC.due_on as due_date,
SRC.in_progress_on as in_progress_date,
SRC.resolved_on as resolved_date,
SRC.completed_on as completed_date,
SRC.cancelled_on as cancelled_date,
SRC.in_progress_flag as in_progress_flag,
SRC.proposed_flag as proposed_flag,
SRC.reopened_flag as reopened_flag,
SRC.overdue_flag as overdue_flag,
SRC.last_updated_on as last_updated_date,
SRC.n_date as n_date,
SRC.n_key as n_key,
coalesce(PROJ.row_key, case when SRC.project is null then 0 else -1 end) as project_key,
SRC.reassignment_count as reassignment_count,
SRC.reopen_count as reopen_count,
SRC.issueid as row_id,
cast((case when SRC.cdctype = 'D' then 'Y' else 'N' end) as char(1)) as soft_deleted_flag,
SRC.sourceinstance as source_id,
SRC.summary as summary,
SRC.work_item_earliest_fixed_version_key as work_item_earliest_fixed_version_key,
SRC.work_item_iteration_key as work_item_iteration_key,
coalesce(PRIO.row_key, case when SRC.work_item_priority is null then 0 else -1 end) as work_item_priority_src_key,
coalesce(STATUS.row_key, case when SRC.work_item_status is null then 0 else -1 end) as work_item_status_src_key,
coalesce(RESOLUTION.row_key, case when SRC.work_item_resolution is null then 0 else -1 end) as work_item_resolution_src_key,
SRC.business_value as business_value,
SRC.story_points as story_points


from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #DWH_TABLE_SCHEMA.d_work_item D
on SRC.issueid=D.row_id
and SRC.sourceinstance=D.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact ASGN
ON (concat('INTERNAL_CONTACT~', SRC.assignee) = ASGN.row_id 
AND SRC.sourceinstance=ASGN.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_project PROJ
ON (SRC.project = PROJ.row_id 
AND SRC.sourceinstance=PROJ.source_id)
left join #DWH_TABLE_SCHEMA.d_lov PRIO
on concat('PRIORITY~WORK_ITEM','~',upper(SRC.work_item_priority))=PRIO.src_rowid
and SRC.sourceinstance=PRIO.source_id
left join #DWH_TABLE_SCHEMA.d_lov STATUS
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status))=STATUS.src_rowid
and SRC.sourceinstance=STATUS.source_id
left join #DWH_TABLE_SCHEMA.d_lov RESOLUTION
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution))=RESOLUTION.src_rowid
and SRC.sourceinstance=RESOLUTION.source_id;

insert into #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base
(work_item_key, age_since_creation, assigned_to_key, cdctype, changed_by, changed_on, created_by, created_on, 
due_date, in_progress_date, resolved_date, completed_date, cancelled_date, in_progress_flag, proposed_flag , 
reopened_flag, overdue_flag, last_updated_date, n_date, n_key, project_key, reassignment_count, reopen_count, row_id, soft_deleted_flag, source_id, summary, 
work_item_earliest_fixed_version_key, work_item_iteration_key, work_item_priority_src_key, work_item_status_src_key, work_item_resolution_src_key, business_value, story_points)

select F.work_item_key as work_item_key,
F.age_since_creation as age_since_creation,
D.work_item_assigned_to_key as assigned_to_key,
F.cdctype as cdctype,
F.changed_by as changed_by,
F.changed_on as changed_on,
F.created_by as created_by,
F.created_on as created_on,
D.due_on as due_date,
D.work_start_on as in_progress_date,
D.resolved_on as resolved_date,
D.completed_on as completed_date,
D.cancelled_on as cancelled_date,
D.in_progress_flag as in_progress_flag,
D.proposed_flag as proposed_flag,
D.reopened_flag as reopened_flag,
D.overdue_flag as overdue_flag,
D.work_item_updated_on as last_updated_date,
CAL.month_start_date as n_date,
CAL.month_start_date_key as n_key,
F.project_key as project_key,
F.reassignment_count as reassignment_count,
F.reopen_count as reopen_count,
F.row_id as row_id,
F.soft_deleted_flag as soft_deleted_flag,
F.source_id as source_id,
D.short_description as summary,
D.earliest_fixed_version_key as work_item_earliest_fixed_version_key,
D.iteration_key as work_item_iteration_key,
D.work_item_priority_src_key as work_item_priority_src_key, 
D.work_item_status_src_key as work_item_status_src_key,
D.work_item_resolution_src_key as work_item_resolution_src_key,
F.business_value as business_value,
F.story_points as story_points

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
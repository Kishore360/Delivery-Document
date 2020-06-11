select
act.source_id
,act.calendar_code
,act.assignment_group_key
,act.row_id
,act.configuration_item_key
,act.category_src_key
,act.opened_by_key
,act.changed_on
,act.created_by
,act.cdctype
,act.opened_by_department_key
,act.incident_key
,act.state_src_key
,act.priority_src_key
,act.soft_deleted_flag
,act.n_key
,act.n_date
,act.business_service_key
,act.assigned_to_key
,act.reopened_flag
,act.age
,act.dormancy_age
,act.age_key
,act.dormancy_age_key
from  #DWH_TABLE_SCHEMA.f_n_incident_weekly act
where act.soft_deleted_flag='N';
select 'ldb.a_incident_backlog_aggregator_weekly_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_backlog_aggregator_weekly_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_backlog_aggregator_weekly_c a11 
join ldb.d_calendar_date a12 
on (a11.aggregate_c_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_backlog_aggregator_weekly_c a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_backlog_aggregator_weekly_c a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_backlog_aggregator_weekly_c a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_key = a15.row_key) 
union
select 'ldb.d_task_priority a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_incident_backlog_aggregator_weekly_c a11 
join ldb.d_task_priority a16 
on (a11.priority_src_key = a16.row_key) 

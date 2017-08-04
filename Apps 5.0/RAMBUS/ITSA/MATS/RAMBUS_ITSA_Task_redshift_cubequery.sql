select 'ldb.f_task a11 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.assigned_to_key = a12.row_key) 
union
select 'ldb.d_task a13 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a13 
on (a11.task_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_task_impact a18 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a13 
on (a11.task_key = a13.row_key) 
join ldb.d_task_impact a18 
on (a13.impact_src_key = a18.row_key) 
union
select 'ldb.d_task_priority a110 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a13 
on (a11.task_key = a13.row_key) 
join ldb.d_task_priority a110 
on (a13.priority_src_key = a110.row_key) 
union
select 'ldb.d_lov_task_state_c  a111 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a13 
on (a11.task_key = a13.row_key) 
join ldb.d_lov_task_state_c  a111 
on (a13.state_src_key = a111.row_key) 
union
select 'ldb.d_task_urgency a112 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a13 
on (a11.task_key = a13.row_key) 
join ldb.d_task_urgency a112 
on (a13.urgency_src_key = a112.row_key) 
union
select 'ldb.d_calendar_month a114 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a114 
on (a14.month_start_date_key = a114.row_key) 
union
select 'ldb.d_internal_contact a115 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_contact a115 
on (a11.opened_by_key  = a115.row_key) 
union
select 'ldb.dh_user_group_hierarchy a116 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy    a116
 on (a15.row_dn_key = a116.lev_0_key)
union
select 'ldb.dh_user_group_level1 a117 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy    a116
 on (a15.row_dn_key = a116.lev_0_key)
join ldb.dh_user_group_level1    a117
 on (a116.lev_1_key = a117.row_key)
 union
 select 'ldb.dh_user_group_level2 a118 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy    a116
 on (a15.row_dn_key = a116.lev_0_key)
join ldb.dh_user_group_level2    a118
 on (a116.lev_2_key = a118.row_key)
  union
 select 'ldb.dh_user_group_level3 a119 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy    a116
 on (a15.row_dn_key = a116.lev_0_key)
join ldb.dh_user_group_level3    a119
 on (a116.lev_3_key = a119.row_key)
   union
 select 'ldb.dh_user_group_level4 a120 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy    a116
 on (a15.row_dn_key = a116.lev_0_key)
join ldb.dh_user_group_level4    a120
 on (a116.lev_4_key = a120.row_key)
union
select 'ldb.d_calendar_quarter a121 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key)
join ldb.d_calendar_quarter a121
 on (a14.quarter_start_date_key = a121.row_key) 
 union
select 'ldb.d_calendar_week a122 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key)
join ldb.d_calendar_week a122
 on (a14.week_start_date_key = a122.row_key) 
 union
select 'ldb.d_application a123 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_application a123
on (a11.application_key  = a123.row_key) 
union
select 'ldb.d_business_service a124' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_business_service a124
on (a11.business_service_key  = a124.row_key) 
union
select 'ldb.d_task_type a125 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a13 
on (a11.task_key = a13.row_key) 
join ldb.d_task_type a125
on (a13.task_type_src_key = a125.row_key) 
union
select 'ldb.d_task_approval a126 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a13 
on (a11.task_key = a13.row_key) 
join ldb.d_task_approval a126
on (a13.approval_src_key = a126.row_key) 
union
select 'ldb.d_task_closed_by a127 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a13 
on (a11.task_key = a13.row_key) 
join ldb.d_task_closed_by a127
on (a13.closed_by_key = a127.row_key) 
union
select 'ldb.d_task_contacttype a128' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a13 
on (a11.task_key = a13.row_key) 
join ldb.d_task_contacttype a128
on (a13.contact_type_src_key = a128.row_key) 
union
select 'ldb.d_task_opened_by a129' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a13 
on (a11.task_key = a13.row_key) 
join ldb.d_task_opened_by a129
on (a13.opened_by_key = a129.row_key) 
union
select 'ldb.dh_assignment_group_type_hierarchy a130' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.dh_assignment_group_type_hierarchy a130
on (a11.assignment_group_key  = a130.user_group_type_key) 
union
select 'ldb.d_location a131' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_location a131
on (a11.location_key  = a131.row_key)
union
select 'ldb.d_parent_task a132' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task a11 
join ldb.d_task a13 
on (a11.task_key = a13.row_key) 
join ldb.d_parent_task a132
on (a13.parent_task_key = a132.row_key)
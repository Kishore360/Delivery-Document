select 'ldb.f_enhancement_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
union
select 'ldb.d_internal_organization_enhancement_task_assignment_group_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_internal_organization_enhancement_task_assignment_group_c a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_enhancement_task_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_enhancement_task_c a13 
on (a11.enhancement_task_c_key = a13.row_key) 
union
select 'ldb.d_calendar_greg_fiscal_c_enhancement_task_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_calendar_greg_fiscal_c_enhancement_task_c a14 
on (a11.opened_on_key = a14.gregorian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal_enhancement_task_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_calendar_greg_fiscal_c_enhancement_task_c a14 
on (a11.opened_on_key = a14.gregorian_calendar_key) 
join ldb.d_calendar_date_fiscal_enhancement_task_c a15 
on (a14.fiscal_calendar_key = a15.row_key) 
union
select 'ldb.d_calendar_date_enhancement_task_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_calendar_date_enhancement_task_c a16 
on (a11.opened_on_key = a16.row_key) 
union
select 'ldb.d_calendar_fiscal_period_enhancement_task_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_calendar_greg_fiscal_c_enhancement_task_c a14 
on (a11.opened_on_key = a14.gregorian_calendar_key) join ldb.d_calendar_date_fiscal_enhancement_task_c a15 
on (a14.fiscal_calendar_key = a15.row_key) 
join ldb.d_calendar_fiscal_period_enhancement_task_c a17 
on (a15.period_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_week_enhancement_task_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_calendar_date_enhancement_task_c a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_week_enhancement_task_c a18 
on (a16.week_start_date_key = a18.row_key) 
union
select 'ldb.d_calendar_year_enhancement_task_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_calendar_date_enhancement_task_c a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_year_enhancement_task_c a19 
on (a16.year_start_date_key = a19.row_key) 
union
select 'ldb.d_enhancement_rm_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_enhancement_rm_c a110 
on (a11.enhancement_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_enhancement_task_assigned_to_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_internal_contact_enhancement_task_assigned_to_c a111 
on (a11.assigned_to_key = a111.row_key) 
union
select 'ldb.d_internal_contact_enhancement_task_closed_by_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_internal_contact_enhancement_task_closed_by_c a112 
on (a11.closed_by_key = a112.row_key) 
union
select 'ldb.d_configuration_item_enhancement_task_ci_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_configuration_item_enhancement_task_ci_c a113 
on (a11.configuration_item_key = a113.row_key) 
union
select 'ldb.d_internal_contact_enhancement_task_opened_by_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_internal_contact_enhancement_task_opened_by_c a114 
on (a11.opened_by_key = a114.row_key) 
union
select 'ldb.d_internal_contact_enhancement_task_ag_director_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_internal_organization_enhancement_task_assignment_group_c a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_contact_enhancement_task_ag_director_c a115 
on (a12.director_c_key = a115.row_key) 
union
select 'ldb.d_internal_contact_enhancement_task_ag_manager_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_internal_organization_enhancement_task_assignment_group_c a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_contact_enhancement_task_ag_manager_c a116 
on (a12.manager_c_key = a116.row_key) 
union
select 'ldb.d_internal_contact_enhancement_task_ag_vp_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_internal_organization_enhancement_task_assignment_group_c a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_contact_enhancement_task_ag_vp_c a117 
on (a12.vp_c_key = a117.row_key) 
union
select 'ldb.d_lov_enhancement_task_contact_type_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_enhancement_task_c a13 
on (a11.enhancement_task_c_key = a13.row_key) 
join ldb.d_lov_enhancement_task_contact_type_c a118 
on (a13.reported_type_src_key = a118.row_key) 
union
select 'ldb.d_lov_enhancement_task_impact_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_enhancement_task_c a13 
on (a11.enhancement_task_c_key = a13.row_key) 
join ldb.d_lov_enhancement_task_impact_c a119 
on (a13.impact_src_key = a119.row_key) 
union
select 'ldb.d_lov_enhancement_task_priority_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_enhancement_task_c a13 
on (a11.enhancement_task_c_key = a13.row_key) 
join ldb.d_lov_enhancement_task_priority_c a120 
on (a13.priority_src_key = a120.row_key) 
union
select 'ldb.d_lov_enhancement_task_state_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_enhancement_task_c a13 
on (a11.enhancement_task_c_key = a13.row_key) 
join ldb.d_lov_enhancement_task_state_c a121 
on (a13.state_src_key = a121.row_key) 
union
select 'ldb.d_lov_enhancement_task_urgency_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_enhancement_task_c a13 
on (a11.enhancement_task_c_key = a13.row_key) 
join ldb.d_lov_enhancement_task_urgency_c a122 
on (a13.urgency_src_key = a122.row_key) 
union
select 'ldb.d_calendar_month_enhancement_task_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_calendar_date_enhancement_task_c a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_month_enhancement_task_c a123 
on (a16.month_start_date_key = a123.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter_enhancement_task_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_calendar_greg_fiscal_c_enhancement_task_c a14 
on (a11.opened_on_key = a14.gregorian_calendar_key) join ldb.d_calendar_date_fiscal_enhancement_task_c a15 
on (a14.fiscal_calendar_key = a15.row_key) 
join ldb.d_calendar_fiscal_quarter_enhancement_task_c a124 
on (a15.quarter_start_date_key = a124.row_key) 
union
select 'ldb.d_calendar_quarter_enhancement_task_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_calendar_date_enhancement_task_c a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_quarter_enhancement_task_c a125 
on (a16.quarter_start_date_key = a125.row_key) 
union
select 'ldb.d_calendar_fiscal_year_enhancement_task_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enhancement_task_c a11 
join ldb.d_calendar_greg_fiscal_c_enhancement_task_c a14 
on (a11.opened_on_key = a14.gregorian_calendar_key) join ldb.d_calendar_date_fiscal_enhancement_task_c a15 
on (a14.fiscal_calendar_key = a15.row_key) 
join ldb.d_calendar_fiscal_year_enhancement_task_c a126 
on (a15.year_start_date_key = a126.row_key) 
select 'ldb.f_hr_change a11 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_internal_contact a12 
on (a11.requested_for_key = a12.row_key) 
union
select 'ldb.dh_employee_hierarchy a13 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_internal_contact a12 
on (a11.requested_for_key = a12.row_key) 
join ldb.dh_employee_hierarchy a13 
on (a12.row_current_key = a13.lev_0_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_internal_organization_department a17 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_internal_organization_department a17 
on (a11.department_key = a17.row_key) 
union
select 'ldb.d_internal_contact_mdm a18 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_internal_contact a12 
on (a11.requested_for_key = a12.row_key) 
join ldb.d_internal_contact_mdm a18 
on (a12.row_current_key = a18.row_current_key) 
union
select 'ldb.d_hr_change_category a19 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_hr_change_category a19 
on (a11.category_src_key = a19.row_key) 
union
select 'ldb.d_hr_change_impact a110 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_hr_change_impact a110 
on (a11.impact_src_key = a110.row_key) 
union
select 'ldb.d_hr_change a111 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_hr_change a111 
on (a11.hr_change_key = a111.row_key) 
union
select 'ldb.d_hr_change_priority a112 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_hr_change_priority a112 
on (a11.priority_src_key = a112.row_key) 
union
select 'ldb.d_hr_change_urgency a113 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_hr_change_urgency a113 
on (a11.urgency_src_key = a113.row_key) 
union
select 'ldb.d_location a114 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_location a114 
on (a11.location_key = a114.row_key) 
union
select 'ldb.dh_employee_level1 a115 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_internal_contact a12 
on (a11.requested_for_key = a12.row_key) join ldb.dh_employee_hierarchy a13 
on (a12.row_current_key = a13.lev_0_key) 
join ldb.dh_employee_level1 a115 
on (a13.lev_1_key = a115.row_key) 
union
select 'ldb.dh_employee_level2 a116 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_internal_contact a12 
on (a11.requested_for_key = a12.row_key) join ldb.dh_employee_hierarchy a13 
on (a12.row_current_key = a13.lev_0_key) 
join ldb.dh_employee_level2 a116 
on (a13.lev_2_key = a116.row_key) 
union
select 'ldb.dh_employee_level3 a117 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_internal_contact a12 
on (a11.requested_for_key = a12.row_key) join ldb.dh_employee_hierarchy a13 
on (a12.row_current_key = a13.lev_0_key) 
join ldb.dh_employee_level3 a117 
on (a13.lev_3_key = a117.row_key) 
union
select 'ldb.dh_employee_level4 a118 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_internal_contact a12 
on (a11.requested_for_key = a12.row_key) join ldb.dh_employee_hierarchy a13 
on (a12.row_current_key = a13.lev_0_key) 
join ldb.dh_employee_level4 a118 
on (a13.lev_4_key = a118.row_key) 
union
select 'ldb.dh_employee_level5 a119 ' as Table_name, count(1) Row_Count
from ldb.f_hr_change a11 
join ldb.d_internal_contact a12 
on (a11.requested_for_key = a12.row_key) join ldb.dh_employee_hierarchy a13 
on (a12.row_current_key = a13.lev_0_key) 
join ldb.dh_employee_level5 a119 
on (a13.lev_5_key = a119.row_key) 

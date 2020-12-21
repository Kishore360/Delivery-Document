select 'ldb.f_caused_by_change a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
union
select 'ldb.d_calendar_rolling_days a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_rolling_days a12
on (a11.date_key = a12.current_date_key)
union
select 'ldb.d_application a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_application a13
on (a11.application_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_assignment_group_manager a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key)
union
select 'ldb.d_h_ag_manager a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key)
join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_configuration_item a17
on (a11.configuration_item_key = a17.row_key)
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
union
select 'ldb.d_change_request a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_change_request a19
on (a11.change_request_key = a19.row_key)
union
select 'ldb.d_configuration_item_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_configuration_item a17
on (a11.configuration_item_key = a17.row_key)
join ldb.d_configuration_item_mdm a110
on (a17.mdm_key = a110.row_key)
union
select 'ldb.d_application_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_application a13
on (a11.application_key = a13.row_key)
join ldb.d_application_mdm a111
on (a13.mdm_key = a111.row_key)
union
select 'ldb.d_ag_manager_level_1 a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key) join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
join ldb.d_ag_manager_level_1 a112
on (a16.assignment_group_manager_level_1_key = a112.row_key)
union
select 'ldb.d_ag_manager_level_2 a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key) join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
join ldb.d_ag_manager_level_2 a113
on (a16.assignment_group_manager_level_2_key = a113.row_key)
union
select 'ldb.d_ag_manager_level_3 a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key) join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
join ldb.d_ag_manager_level_3 a114
on (a16.assignment_group_manager_level_3_key = a114.row_key)
union
select 'ldb.d_ag_manager_level_4 a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key) join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
join ldb.d_ag_manager_level_4 a115
on (a16.assignment_group_manager_level_4_key = a115.row_key)
union
select 'ldb.d_ag_manager_level_5 a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key) join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key) join ldb.d_h_ag_manager a16
on (a15.assignment_group_manager_hierarchy_key = a16.row_key)
join ldb.d_ag_manager_level_5 a116
on (a16.assignment_group_manager_level_5_key = a116.row_key)
union
select 'ldb.d_business_service a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_business_service a117
on (a11.business_service_key = a117.row_key)
union
select 'ldb.d_internal_organization_department a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_internal_organization_department a118
on (a11.requested_by_department_key = a118.row_key)
union
select 'ldb.d_calendar_date_rolling a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_rolling_days a12
on (a11.date_key = a12.current_date_key)
join ldb.d_calendar_date_rolling a119
on (a12.rolling_date_key = a119.row_key)
union
select 'ldb.d_calendar_month a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
join ldb.d_calendar_month a120
on (a18.month_start_date_key = a120.row_key)
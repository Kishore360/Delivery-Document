select 'ldb.f_cmdb_appl_hierarchy_task_details_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_change_request_caused_by a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_change_request_caused_by a13
on (a11.caused_by_change_key = a13.row_key)
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
union
select 'ldb.d_fmr_product_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_fmr_product_c a15
on (a12.fmr_product_c_key = a15.row_key)
union
select 'ldb.d_fmr_product_line_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_fmr_product_c a15
on (a12.fmr_product_c_key = a15.row_key)
join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key)
union
select 'ldb.d_fmr_cost_center_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_fmr_product_c a15
on (a12.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key)
join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key)
union
select 'ldb.d_fmr_business_unit_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_fmr_product_c a15
on (a12.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key) join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key)
join ldb.d_fmr_business_unit_c a18
on (a17.fmr_business_unit_c_key = a18.row_key)
union
select 'ldb.d_fmr_business_group_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_fmr_product_c a15
on (a12.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key) join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key) join ldb.d_fmr_business_unit_c a18
on (a17.fmr_business_unit_c_key = a18.row_key)
join ldb.d_fmr_business_group_c a19
on (a18.fmr_business_group_c_key = a19.row_key)
union
select 'ldb.d_fmr_operating_committee_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_fmr_product_c a15
on (a12.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key) join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key) join ldb.d_fmr_business_unit_c a18
on (a17.fmr_business_unit_c_key = a18.row_key) join ldb.d_fmr_business_group_c a19
on (a18.fmr_business_group_c_key = a19.row_key)
join ldb.d_fmr_operating_committee_c a110
on (a19.fmr_operating_committee_c_key = a110.row_key)
union
select 'ldb.d_fmr_cio_group_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_fmr_product_c a15
on (a12.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key) join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key) join ldb.d_fmr_business_unit_c a18
on (a17.fmr_business_unit_c_key = a18.row_key) join ldb.d_fmr_business_group_c a19
on (a18.fmr_business_group_c_key = a19.row_key) join ldb.d_fmr_operating_committee_c a110
on (a19.fmr_operating_committee_c_key = a110.row_key)
join ldb.d_fmr_cio_group_c a111
on (a110.fmr_cio_group_c_key = a111.row_key)
union
select 'ldb.d_change_request a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
union
select 'ldb.d_outage a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_outage a113
on (a11.outage_key = a113.row_key)
union
select 'ldb.d_incident a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
union
select 'ldb.d_calendar_date a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_calendar_date a115
on (a11.date_key = a115.row_key)
union
select 'ldb.d_calendar_month a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_calendar_date a115
on (a11.date_key = a115.row_key)
join ldb.d_calendar_month a116
on (a115.month_start_date_key = a116.row_key)
union
select 'ldb.d_problem a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_problem a117
on (a11.problem_key = a117.row_key)
union
select 'ldb.d_application_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a118
on (a12.mdm_key = a118.row_key)
union
select 'ldb.d_change_request_caused_by_type a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_change_request_caused_by a13
on (a11.caused_by_change_key = a13.row_key)
join ldb.d_change_request_caused_by_type a119
on (a13.type_src_key = a119.row_key)
union
select 'ldb.d_configuration_item_mdm a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_configuration_item_mdm a120
on (a14.mdm_key = a120.row_key)
union
select 'ldb.d_incident_priority a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_priority a121
on (a114.priority_src_key = a121.row_key)
union
select 'ldb.d_outage_type a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_outage a113
on (a11.outage_key = a113.row_key)
join ldb.d_outage_type a122
on (a113.outage_type_src_key = a122.row_key)
union
select 'ldb.d_cio_group_status_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_fmr_product_c a15
on (a12.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key) join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key) join ldb.d_fmr_business_unit_c a18
on (a17.fmr_business_unit_c_key = a18.row_key) join ldb.d_fmr_business_group_c a19
on (a18.fmr_business_group_c_key = a19.row_key) join ldb.d_fmr_operating_committee_c a110
on (a19.fmr_operating_committee_c_key = a110.row_key) join ldb.d_fmr_cio_group_c a111
on (a110.fmr_cio_group_c_key = a111.row_key)
join ldb.d_cio_group_status_c a123
on (a111.cio_group_status_c_key = a123.row_key)
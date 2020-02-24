select 'ldb.f_cmdb_appl_hierarchy_task_details_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_application a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a14
on (a11.application_key = a14.row_key)
union
select 'ldb.d_fmr_product_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a14
on (a11.application_key = a14.row_key)
join ldb.d_fmr_product_c a15
on (a14.fmr_product_c_key = a15.row_key)
union
select 'ldb.d_fmr_product_line_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a14
on (a11.application_key = a14.row_key) join ldb.d_fmr_product_c a15
on (a14.fmr_product_c_key = a15.row_key)
join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key)
union
select 'ldb.d_fmr_cost_center_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a14
on (a11.application_key = a14.row_key) join ldb.d_fmr_product_c a15
on (a14.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key)
join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key)
union
select 'ldb.d_fmr_business_unit_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a14
on (a11.application_key = a14.row_key) join ldb.d_fmr_product_c a15
on (a14.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key) join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key)
join ldb.d_fmr_business_unit_c a18
on (a17.fmr_business_unit_c_key = a18.row_key)
union
select 'ldb.d_fmr_business_group_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a14
on (a11.application_key = a14.row_key) join ldb.d_fmr_product_c a15
on (a14.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key) join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key) join ldb.d_fmr_business_unit_c a18
on (a17.fmr_business_unit_c_key = a18.row_key)
join ldb.d_fmr_business_group_c a19
on (a18.fmr_business_group_c_key = a19.row_key)
union
select 'ldb.d_fmr_operating_committee_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a14
on (a11.application_key = a14.row_key) join ldb.d_fmr_product_c a15
on (a14.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key) join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key) join ldb.d_fmr_business_unit_c a18
on (a17.fmr_business_unit_c_key = a18.row_key) join ldb.d_fmr_business_group_c a19
on (a18.fmr_business_group_c_key = a19.row_key)
join ldb.d_fmr_operating_committee_c a110
on (a19.fmr_operating_committee_c_key = a110.row_key)
union
select 'ldb.d_fmr_cio_group_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a14
on (a11.application_key = a14.row_key) join ldb.d_fmr_product_c a15
on (a14.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key) join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key) join ldb.d_fmr_business_unit_c a18
on (a17.fmr_business_unit_c_key = a18.row_key) join ldb.d_fmr_business_group_c a19
on (a18.fmr_business_group_c_key = a19.row_key) join ldb.d_fmr_operating_committee_c a110
on (a19.fmr_operating_committee_c_key = a110.row_key)
join ldb.d_fmr_cio_group_c a111
on (a110.fmr_cio_group_c_key = a111.row_key)
union
select 'ldb.d_incident a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_incident a112
on (a11.incident_key = a112.row_key)
union
select 'ldb.d_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month a113
on (a12.month_start_date_key = a113.row_key)
union
select 'ldb.d_configuration_item_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a114
on (a13.mdm_key = a114.row_key)
union
select 'ldb.d_cio_group_status_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_appl_hierarchy_task_details_c a11
join ldb.d_application a14
on (a11.application_key = a14.row_key) join ldb.d_fmr_product_c a15
on (a14.fmr_product_c_key = a15.row_key) join ldb.d_fmr_product_line_c a16
on (a15.fmr_product_line_c_key = a16.row_key) join ldb.d_fmr_cost_center_c a17
on (a16.cost_center_c_key = a17.row_key) join ldb.d_fmr_business_unit_c a18
on (a17.fmr_business_unit_c_key = a18.row_key) join ldb.d_fmr_business_group_c a19
on (a18.fmr_business_group_c_key = a19.row_key) join ldb.d_fmr_operating_committee_c a110
on (a19.fmr_operating_committee_c_key = a110.row_key) join ldb.d_fmr_cio_group_c a111
on (a110.fmr_cio_group_c_key = a111.row_key)
join ldb.d_cio_group_status_c a115
on (a111.cio_group_status_c_key = a115.row_key)
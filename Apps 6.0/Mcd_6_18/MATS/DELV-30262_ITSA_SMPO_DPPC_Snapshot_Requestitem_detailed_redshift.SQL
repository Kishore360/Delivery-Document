select 'ldb."f_n_a_request_item_backlog_smpo_dppc" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_a_request_item_backlog_smpo_dppc" a11
union
select 'ldb."d_h_ag_manager_scd2" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_a_request_item_backlog_smpo_dppc" a11
join "ldb"."d_h_ag_manager_scd2" a12
on (a11.ag_manager_hierarchy_scd2_key = a12.row_key)
union
select 'ldb."d_calendar_month" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_a_request_item_backlog_smpo_dppc" a11
join "ldb"."d_calendar_month" a13
on (a11.month_key = a13.row_key)
union
select 'ldb."d_internal_contact_assigned_to" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_a_request_item_backlog_smpo_dppc" a11
join "ldb"."d_internal_contact_assigned_to" a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb."d_internal_organization_group" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_a_request_item_backlog_smpo_dppc" a11
join "ldb"."d_internal_organization_group" a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb."d_ag_manager_level_0_scd2" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_a_request_item_backlog_smpo_dppc" a11
join "ldb"."d_h_ag_manager_scd2" a12
on (a11.ag_manager_hierarchy_scd2_key = a12.row_key)
join "ldb"."d_ag_manager_level_0_scd2" a16
on (a12.employee_level_0_key = a16.row_key)
union
select 'ldb."d_ag_manager_level_1_scd2" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_a_request_item_backlog_smpo_dppc" a11
join "ldb"."d_h_ag_manager_scd2" a12
on (a11.ag_manager_hierarchy_scd2_key = a12.row_key)
join "ldb"."d_ag_manager_level_1_scd2" a17
on (a12.employee_level_1_key = a17.row_key)
union
select 'ldb."d_ag_manager_level_2_scd2" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_a_request_item_backlog_smpo_dppc" a11
join "ldb"."d_h_ag_manager_scd2" a12
on (a11.ag_manager_hierarchy_scd2_key = a12.row_key)
join "ldb"."d_ag_manager_level_2_scd2" a18
on (a12.employee_level_2_key = a18.row_key)
union
select 'ldb."d_ag_manager_level_3_scd2" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_a_request_item_backlog_smpo_dppc" a11
join "ldb"."d_h_ag_manager_scd2" a12
on (a11.ag_manager_hierarchy_scd2_key = a12.row_key)
join "ldb"."d_ag_manager_level_3_scd2" a19
on (a12.employee_level_3_key = a19.row_key)
union
select 'ldb."d_internal_contact_request_item_closed_by_smpo" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_a_request_item_backlog_smpo_dppc" a11
join "ldb"."d_internal_contact_request_item_closed_by_smpo" a110
on (a11.request_item_closed_by_key = a110.row_key)
union
select 'ldb."d_supplier_assigned_to_vendor_snapshot" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_a_request_item_backlog_smpo_dppc" a11
join "ldb"."d_supplier_assigned_to_vendor_snapshot" a111
on (a11.vendor_key = a111.row_key)
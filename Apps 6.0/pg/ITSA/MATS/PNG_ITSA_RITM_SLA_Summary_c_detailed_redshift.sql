select 'ldb.f_request_item_task_sla_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
union
select 'ldb.d_ag_manager_role_vp_dir_ad_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_ag_manager_role_vp_dir_ad_c a12
on (a11.inc_assignment_group_key = a12.row_key)
union
select 'ldb.d_task_sla a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_task_sla a13
on (a11.sla_key = a13.row_key)
union
select 'ldb.d_ag_manager_role_vp_dir_ad_task_sla_owner_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_task_sla a13
on (a11.sla_key = a13.row_key)
join ldb.d_ag_manager_role_vp_dir_ad_task_sla_owner_c a14
on (a13.u_owned_by_c_key = a14.row_key)
union
select 'ldb.d_internal_contact_ad_sla_owner_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_task_sla a13
on (a11.sla_key = a13.row_key) join ldb.d_ag_manager_role_vp_dir_ad_task_sla_owner_c a14
on (a13.u_owned_by_c_key = a14.row_key)
join ldb.d_internal_contact_ad_sla_owner_c a15
on (a14.associate_director_key = a15.row_key)
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
union
select 'ldb.d_internal_contact_director_sla_owner_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_task_sla a13
on (a11.sla_key = a13.row_key) join ldb.d_ag_manager_role_vp_dir_ad_task_sla_owner_c a14
on (a13.u_owned_by_c_key = a14.row_key)
join ldb.d_internal_contact_director_sla_owner_c a19
on (a14.director_key = a19.row_key)
union
select 'ldb.d_internal_contact_director_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_ag_manager_role_vp_dir_ad_c a12
on (a11.inc_assignment_group_key = a12.row_key)
join ldb.d_internal_contact_director_c a110
on (a12.director_key = a110.row_key)
union
select 'ldb.d_request_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_request_item a111
on (a11.request_item_key = a111.row_key)
union
select 'ldb.d_internal_contact_vp_sla_owner_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_task_sla a13
on (a11.sla_key = a13.row_key) join ldb.d_ag_manager_role_vp_dir_ad_task_sla_owner_c a14
on (a13.u_owned_by_c_key = a14.row_key)
join ldb.d_internal_contact_vp_sla_owner_c a112
on (a14.vp_key = a112.row_key)
union
select 'ldb.d_internal_contact_vp_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_ag_manager_role_vp_dir_ad_c a12
on (a11.inc_assignment_group_key = a12.row_key)
join ldb.d_internal_contact_vp_c a113
on (a12.vp_key = a113.row_key)
union
select 'ldb.d_internal_organization_group a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_internal_organization_group a114
on (a11.assignment_group_key = a114.row_key)
union
select 'ldb.d_internal_contact_associate_director_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_ag_manager_role_vp_dir_ad_c a12
on (a11.inc_assignment_group_key = a12.row_key)
join ldb.d_internal_contact_associate_director_c a115
on (a12.associate_director_key = a115.row_key)
union
select 'ldb.d_sc_req_item_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_sc_req_item_priority a116
on (a11.priority_src_key_c = a116.row_key)
union
select 'ldb.d_task_sla_stage a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_task_sla_stage a117
on (a11.stage_src_key = a117.row_key)
union
select 'ldb.d_task_sla_name a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_task_sla a13
on (a11.sla_key = a13.row_key)
join ldb.d_task_sla_name a118
on (a13.sla_category_key = a118.row_key)
union
select 'ldb.d_internal_organization_vendor_company_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_task_sla a13
on (a11.sla_key = a13.row_key)
join ldb.d_internal_organization_vendor_company_c a119
on (a13.vendor_c_key = a119.row_key)
union
select 'ldb.d_calendar_year a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_task_sla_c a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
join ldb.d_calendar_year a120
on (a18.year_start_date_key = a120.row_key)
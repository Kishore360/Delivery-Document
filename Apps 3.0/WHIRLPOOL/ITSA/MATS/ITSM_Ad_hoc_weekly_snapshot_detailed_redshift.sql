select 'ldb.n_ad_hoc_request_weekly_c a11 ' as Table_name, count(1) Row_Count
from ldb.n_ad_hoc_request_weekly_c a11 

union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(1) Row_Count
from ldb.n_ad_hoc_request_weekly_c a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(1) Row_Count
from ldb.n_ad_hoc_request_weekly_c a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(1) Row_Count
from ldb.n_ad_hoc_request_weekly_c a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_key = a15.row_key) 

union
select 'ldb.d_region_c a17 ' as Table_name, count(1) Row_Count
from ldb.n_ad_hoc_request_weekly_c a11 
join ldb.d_region_c a17 
on (a11.region_key = a17.row_key) 
union
select 'ldb.d_ad_hoc_request_priority_c a18 ' as Table_name, count(1) Row_Count
from ldb.n_ad_hoc_request_weekly_c a11 
join ldb.d_ad_hoc_request_priority_c a18 
on (a11.priority_src_key = a18.row_key) 
union
select 'ldb.d_ad_hoc_request_reported_type_c a19 ' as Table_name, count(1) Row_Count
from ldb.n_ad_hoc_request_weekly_c a11 
join ldb.d_ad_hoc_request_reported_type_c a19 
on (a11.reported_type_src_key = a19.row_key) 
union
select 'ldb.d_ad_hoc_request_state_c a110 ' as Table_name, count(1) Row_Count
from ldb.n_ad_hoc_request_weekly_c a11 
join ldb.d_ad_hoc_request_state_c a110 
on (a11.state_src_key = a110.row_key) 

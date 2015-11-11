SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select  'f_request_item' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11
union

select  'd_request_item_variable_app_not_listed' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request_item_variable_app_not_listed	a14
on 		(a11.request_item_key = a14.row_key)
union

select  'd_request_item_variable_app_not_listed_choice' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request_item_variable_app_not_listed_choice	a15
on 		(a11.request_item_key = a15.row_key)
union

select  'd_request_item_variable_app_not_listed_label' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request_item_variable_app_not_listed_label	a16
on 		(a11.request_item_key = a16.row_key)
union

select  'd_request_item_variable_asset_tag' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request_item_variable_asset_tag	a17
on 		(a11.request_item_key = a17.row_key)
union

select  'd_request_item' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request_item	a18
on 		(a11.request_item_key = a18.row_key)
union
select  'd_request_item_variable_date_time' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request_item_variable_date_time	a110
on 		(a11.request_item_key = a110.row_key)
union

select  'd_request_item_variable_description' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request_item_variable_description	a111
on 		(a11.request_item_key = a111.row_key)
union

select  'd_request_item_variable_request_summary' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request_item_variable_request_summary	a113
on 		(a11.request_item_key = a113.row_key)
union

select  'd_request_item_variable_requested_date' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request_item_variable_requested_date	a114
on 		(a11.request_item_key = a114.row_key)
union

select  'd_request_item_variable_scope_of_work' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request_item_variable_scope_of_work	a115
on 		(a11.request_item_key = a115.row_key)
union

select  'd_request_item_variable_work_window' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request_item_variable_work_window	a116
on 		(a11.request_item_key = a116.row_key)
union

select  'd_bufg_c_business_unit' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_bufg_c_business_unit	a119
on 		(a11.business_unit_c_key = a119.row_key)
union

select  'd_configuration_application_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_configuration_application_c	a120
on 		(a11.cmdb_ci_c_key = a120.row_key)
union

select  'd_varaible_lov_data_center_request_item' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_variable_lov_c_data_center_request_item	a121
on 		(a11.data_center_c_key = a121.row_key)
union

select  'd_internal_contact_mdm' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_internal_contact	a12
on 	(a11.opened_by_key = a12.row_key)
join	ldb.d_internal_contact_mdm	a122
on 		(a12.row_current_key = a122.row_key)
union

select  'd_party_primary_contact' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_party_primary_contact	a123
on 		(a11.primary_contact_c_key = a123.row_current_key)
union

select  'd_request' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_request	a124
on 		(a11.request_key = a124.row_key)
union
select  'd_varaible_lov_service_requested_for' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_variable_lov_c_service_requested_for	a127
on 		(a11.service_requested_for_c_key = a127.row_key)
union

select  'd_bufg_c_bu_func_group' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_bufg_c_bu_func_group	a130
on 		(a11.bu_func_group_c_key = a130.row_key)
union

select  'd_service_delivery_team_l4s_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_request_item a11 
join	ldb.d_service_delivery_team_l4s_c	a131
on 		(a11.l4_options_c_key = a131.row_key)

)a)b
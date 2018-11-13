select 'ldb.f_request_item a11 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 	
union
select 'ldb.d_calendar_date_fiscal a11 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 
    join          ldb.d_calendar_date_fiscal    a13
                  on          (a11.opened_on_key = a13.row_key)							
union
select 'ldb.d_calendar_fiscal_quarter a11 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 
    join          ldb.d_calendar_date_fiscal    a13
                  on          (a11.opened_on_key = a13.row_key)
				    join          ldb.d_calendar_fiscal_quarter               a115
                  on          (a13.quarter_start_date_key = a115.row_key)
				  
				  union
				  select 'ldb.d_calendar_fiscal_year a11 ' as Table_name, count(1) Row_Count						
from ldb.f_request_item a11 
    join          ldb.d_calendar_date_fiscal    a13
                  on          (a11.opened_on_key = a13.row_key)
				    join          ldb.d_calendar_fiscal_year               a115
                  on          (a13.year_start_date_key = a115.row_key)
				  
				  union								
select 'ldb.d_internal_contact a12 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_internal_contact a12 								
on (a11.opened_by_key = a12.row_key) 								
union								
select 'ldb.d_master_item a13 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_master_item a13 								
on (a11.catalog_item_key = a13.row_key) 								
union								
select 'ldb.d_request_item a14 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_request_item a14 								
on (a11.request_item_key = a14.row_key) 								
union								
select 'ldb.d_calendar_date a15 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_calendar_date a15 								
on (a11.opened_on_key = a15.row_key) 								
union								
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_internal_organization_group a16 								
on (a11.assignment_group_key = a16.row_key) 								
union								
select 'ldb.d_request a17 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_request a17 								
on (a11.request_key = a17.row_key) 								
union								
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_internal_contact_assigned_to a18 								
on (a11.assigned_to_key = a18.row_key) 								
union								
select 'ldb.d_internal_contact_mdm a19 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_internal_contact a12 								
on (a11.opened_by_key = a12.row_key) 								
join ldb.d_internal_contact_mdm a19 								
on (a12.row_current_key = a19.row_current_key) 								
union								
select 'ldb.d_duration_c_requested_for_c a110 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_duration_requested_for_c a110 								
on (a11.requested_for_employee_duration_c = a110.duration_c_key) 								
union								
select 'ldb.d_duration_c a111 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_duration_c a111 								
on (a11.opened_by_employee_duration_c = a111.duration_c_key) 								
union								
select 'ldb.d_hr_change_category a112 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_hr_change_category a112 								
on (a11.hr_category_src_key = a112.row_key) 								
union								
select 'ldb.d_hr_change a113 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_hr_change a113 								
on (a11.hr_change_key = a113.row_key) 								
union								
select 'ldb.d_sc_req_item_approval a114 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_sc_req_item_approval a114 								
on (a11.approval_state_src_key = a114.row_key) 								
union								
select 'ldb.d_request_item_stage a115 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_request_item_stage a115 								
on (a11.stage_src_key = a115.row_key) 								
union								
select 'ldb.d_request_item_state a116 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_request_item_state a116 								
on (a11.state_src_key = a116.row_key) 								
union								
select 'ldb.d_internal_contact_requested_for a117 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_internal_contact_requested_for a117 								
on (a11.requested_for_key = a117.row_key) 								
union								
select 'ldb.d_internal_contact_task_closed_by a118 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_internal_contact_task_closed_by a118 								
on (a11.closed_by_key = a118.row_key) 								
union								
select 'ldb.d_lov_request_item_employee_type_c  a119 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_request_item a14 								
on (a11.request_item_key = a14.row_key) 								
join ldb.d_lov_request_item_employee_type_c  a119 								
on (a14.employee_type_c_key = a119.row_key) 								
union								
select 'ldb.d_calendar_month a120 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_calendar_date a15 								
on (a11.opened_on_key = a15.row_key) 								
join ldb.d_calendar_month a120 								
on (a15.month_start_date_key = a120.row_key) 								
union								
select 'ldb.d_internal_organization_group_parent_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group_parent_internal_c a13 
on (a11.assignment_group_c_key = a13.row_key) 
join ldb.d_internal_organization_group_parent_c a122 
on (a13.parent_row_c_key = a122.row_key) 								
union								
select 'ldb.d_calendar_week a122 ' as Table_name, count(1) Row_Count								
from ldb.f_request_item a11 								
join ldb.d_calendar_date a15 								
on (a11.opened_on_key = a15.row_key) 								
join ldb.d_calendar_week a122 								
on (a15.week_start_date_key = a122.row_key) 	
							

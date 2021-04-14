/* Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_configuration_item
d_configuration_item_mdm
d_internal_contact
d_internal_contact_assigned_to
d_internal_organization_department
d_internal_organization_group
d_lov_employee_type_c
d_master_item
d_request
d_request_item
d_request_item_from_stage
d_request_item_from_state
d_request_item_stage
d_request_item_state
d_request_item_to_stage
d_request_item_to_state
d_sc_req_item_priority
f_request_item_activity

 */
 
 
select 'ldb."f_request_item_activity" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key)  
 union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_configuration_item" a13 
 on (a11.configuration_item_key = a13.row_key)  
 union
select 'ldb."d_internal_contact" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_internal_contact" a14 
 on (a11.employee_key = a14.row_key)  
 union
select 'ldb."d_calendar_week" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
join "ldb"."d_calendar_week" a15 
 on (a12.week_start_date_key = a15.row_key)  
 union
select 'ldb."d_internal_contact_assigned_to" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_internal_contact_assigned_to" a16 
 on (a11.assigned_to_key = a16.row_key)  
 union
select 'ldb."d_internal_organization_group" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_internal_organization_group" a17 
 on (a11.assignment_group_key = a17.row_key)  
 union
select 'ldb."d_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
join "ldb"."d_calendar_month" a18 
 on (a12.month_start_date_key = a18.row_key)  
 union
select 'ldb."d_calendar_quarter" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_calendar_month" a18 
 on (a12.month_start_date_key = a18.row_key) 
join "ldb"."d_calendar_quarter" a19 
 on (a18.quarter_start_date_key = a19.row_key)  
 union
select 'ldb."d_calendar_year" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_calendar_month" a18 
 on (a12.month_start_date_key = a18.row_key) join "ldb"."d_calendar_quarter" a19 
 on (a18.quarter_start_date_key = a19.row_key) 
join "ldb"."d_calendar_year" a110 
 on (a19.year_start_date_key = a110.row_key)  
 union
select 'ldb."d_request_item" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_request_item" a111 
 on (a11.request_item_key = a111.row_key)  
 union
select 'ldb."d_request" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_request" a112 
 on (a11.request_key = a112.row_key)  
 union
select 'ldb."d_configuration_item_mdm" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_configuration_item" a13 
 on (a11.configuration_item_key = a13.row_key) 
join "ldb"."d_configuration_item_mdm" a113 
 on (a13.mdm_key = a113.row_key)  
 union
select 'ldb."d_internal_organization_department" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_internal_contact" a14 
 on (a11.employee_key = a14.row_key) 
join "ldb"."d_internal_organization_department" a114 
 on (a14.department_key = a114.row_key)  
 union
select 'ldb."d_master_item" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_master_item" a115 
 on (a11.item_key = a115.row_key)  
 union
select 'ldb."d_request_item_from_stage" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_request_item_from_stage" a116 
 on (a11.from_stage_key = a116.row_key)  
 union
select 'ldb."d_request_item_from_state" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_request_item_from_state" a117 
 on (a11.from_state_key = a117.row_key)  
 union
select 'ldb."d_sc_req_item_priority" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_sc_req_item_priority" a118 
 on (a11.priority_src_key = a118.row_key)  
 union
select 'ldb."d_request_item_stage" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_request_item_stage" a119 
 on (a11.current_stage_src_key = a119.row_key)  
 union
select 'ldb."d_request_item_state" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_request_item_state" a120 
 on (a11.current_state_src_key = a120.row_key)  
 union
select 'ldb."d_request_item_to_stage" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_request_item_to_stage" a121 
 on (a11.to_stage_key = a121.row_key)  
 union
select 'ldb."d_request_item_to_state" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_request_item_to_state" a122 
 on (a11.to_state_key = a122.row_key)  
 union
select 'ldb."d_lov_employee_type_c" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item_activity" a11 
 join "ldb"."d_internal_contact_assigned_to" a16 
 on (a11.assigned_to_key = a16.row_key) 
join "ldb"."d_lov_employee_type_c" a123 
 on (a16.employee_type_c_key = a123.row_key)  


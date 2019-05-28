select 'ldb.f_task_fss_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key)  
union
select 'ldb.d_task_fss_c a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_task_fss_c a13 
 on (a11.task_fss_c_key = a13.row_key)  
union
select 'ldb.d_internal_contact_customer_c a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_internal_contact_customer_c a14 
 on (a11.customer_c_key = a14.row_key)  
union
select 'ldb.d_calendar_week a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key) 
 join ldb.d_calendar_week a15 
 on (a12.week_start_date_key = a15.row_key)  
union
select 'ldb.d_calendar_year a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key) 
 join ldb.d_calendar_year a16 
 on (a12.year_start_date_key = a16.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_internal_contact_assigned_to a17 
 on (a11.assigned_to_key = a17.row_key)  
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_internal_organization_group a18 
 on (a11.assignment_group_key = a18.row_key)  
union
select 'ldb.d_internal_contact_cardholder_name_c a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_internal_contact_cardholder_name_c a19 
 on (a11.cardholder_name_c_key = a19.row_key)  
union
select 'ldb.d_internal_contact_claimant_s_name_c a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_internal_contact_claimant_s_name_c a110 
 on (a11.claimant_s_name_c_key = a110.row_key)  
union
select 'ldb.d_internal_contact_po_requester_name_c a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_internal_contact_po_requester_name_c a111 
 on (a11.po_requester_name_c_key = a111.row_key)  
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key) 
 join ldb.d_calendar_month a112 
 on (a12.month_start_date_key = a112.row_key)  
union
select 'ldb.d_lov_closure_code_c a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_task_fss_c a13 
 on (a11.task_fss_c_key = a13.row_key) 
 join ldb.d_lov_closure_code_c a113 
 on (a13.closure_code_c_key = a113.row_key)  
union
select 'ldb.d_lov_contact_type_c a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_task_fss_c a13 
 on (a11.task_fss_c_key = a13.row_key) 
 join ldb.d_lov_contact_type_c a114 
 on (a13.contact_type_c_key = a114.row_key)  
union
select 'ldb.d_cost_center_affected_user_c a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_internal_contact_customer_c a14 
 on (a11.customer_c_key = a14.row_key) 
 join ldb.d_cost_center_affected_user_c a115 
 on (a14.cost_center_key = a115.row_key)  
union
select 'ldb.d_internal_organization_affected_user_department_c a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_internal_contact_customer_c a14 
 on (a11.customer_c_key = a14.row_key) 
 join ldb.d_internal_organization_affected_user_department_c a116 
 on (a14.department_key = a116.row_key)  
union
select 'ldb.d_lov_customer_geo_c a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_task_fss_c a13 
 on (a11.task_fss_c_key = a13.row_key) 
 join ldb.d_lov_customer_geo_c a117 
 on (a13.customer_geo_c_key = a117.row_key)  
union
select 'ldb.d_lov_hold_type_c a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_task_fss_c a13 
 on (a11.task_fss_c_key = a13.row_key) 
 join ldb.d_lov_hold_type_c a118 
 on (a13.hold_type_c_key = a118.row_key)  
union
select 'ldb.d_lov_payment_request_type_c a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_task_fss_c a13 
 on (a11.task_fss_c_key = a13.row_key) 
 join ldb.d_lov_payment_request_type_c a119 
 on (a13.payment_request_type_c_key = a119.row_key)  
union
select 'ldb.d_lov_priority_c a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_task_fss_c a13 
 on (a11.task_fss_c_key = a13.row_key) 
 join ldb.d_lov_priority_c a120 
 on (a13.priority_c_key = a120.row_key)  
union
select 'ldb.d_lov_state_c a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_task_fss_c a13 
 on (a11.task_fss_c_key = a13.row_key) 
 join ldb.d_lov_state_c a121 
 on (a13.state_c_key = a121.row_key)  
union
select 'ldb.d_lov_supplier_type_c a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_fss_c a11 
 join ldb.d_task_fss_c a13 
 on (a11.task_fss_c_key = a13.row_key) 
 join ldb.d_lov_supplier_type_c a122 
 on (a13.supplier_type_c_key = a122.row_key)  


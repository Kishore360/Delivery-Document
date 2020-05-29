select 'ldb.f_configuration_item_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key)  
union
select 'ldb.d_lov_ci_age_c a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_lov_ci_age_c a13 
 on (a11.ci_age_c_key = a13.row_key)  
union
select 'ldb.d_ci_application_architect_c a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_application_architect_c a14 
 on (a12.ci_application_architect_c_key = a14.row_key)  
union
select 'ldb.d_lov_ci_application_subtype_c a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_lov_ci_application_subtype_c a15 
 on (a12.ci_application_subtype_c_key = a15.row_key)  
union
select 'ldb.d_lov_ci_application_type_c a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_lov_ci_application_type_c a16 
 on (a12.ci_application_type_c_key = a16.row_key)  
union
select 'ldb.d_ci_change_control_c a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_change_control_c a17 
 on (a12.ci_change_control_c_key = a17.row_key)  
union
select 'ldb.d_lov_ci_bu_coe_c a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_lov_ci_bu_coe_c a18 
 on (a12.ci_bu_coe_c_key = a18.row_key)  
union
select 'ldb.d_lov_ci_business_criticality_c a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_lov_ci_business_criticality_c a19 
 on (a12.ci_business_criticality_c_key = a19.row_key)  
union
select 'ldb.d_configuration_item_location_c a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_configuration_item_location_c a110 
 on (a12.location_key = a110.row_key)  
union
select 'ldb.d_lov_ci_customer_type_c a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_lov_ci_customer_type_c a111 
 on (a12.ci_customer_type_c_key = a111.row_key)  
union
select 'ldb.d_lov_ci_data_classification_c a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_lov_ci_data_classification_c a112 
 on (a12.ci_data_classification_c_key = a112.row_key)  
union
select 'ldb.d_ci_department_c a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_department_c a113 
 on (a12.ci_department_c_key = a113.row_key)  
union
select 'ldb.d_ci_enterpise_architect_c a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_enterpise_architect_c a114 
 on (a12.ci_enterpise_architect_c_key = a114.row_key)  
union
select 'ldb.d_ci_it_leader_c a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_it_leader_c a115 
 on (a12.ci_it_leader_c_key = a115.row_key)  
union
select 'ldb.d_ci_location_logical_c a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_location_logical_c a116 
 on (a12.ci_location_logical_c_key = a116.row_key)  
union
select 'ldb.d_ci_maintenance_schedule_c a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_maintenance_schedule_c a117 
 on (a12.ci_maintenance_schedule_c_key = a117.row_key)  
union
select 'ldb.d_ci_model_id_c a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_model_id_c a118 
 on (a12.ci_model_id_c_key = a118.row_key)  
union
select 'ldb.d_ci_operational_status_c a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_operational_status_c a119 
 on (a12.ci_operational_status_c = a119.row_key)  
union
select 'ldb.d_ci_owner_group_c a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_owner_group_c a120 
 on (a12.ci_owner_group_c_key = a120.row_key)  
union
select 'ldb.d_lov_ci_platform_subtype_c a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_lov_ci_platform_subtype_c a121 
 on (a12.ci_platform_subtype_c_key = a121.row_key)  
union
select 'ldb.d_lov_ci_service_type_c a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_lov_ci_service_type_c a122 
 on (a12.ci_service_type_c_key = a122.row_key)  
union
select 'ldb.d_lov_ci_install_status_c a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_lov_ci_install_status_c a123 
 on (a12.ci_install_status_c_key = a123.row_key)  
union
select 'ldb.d_ci_support_group_c a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_support_group_c a124 
 on (a12.ci_support_group_c_key = a124.row_key)  
union
select 'ldb.d_lov_ci_used_for_c a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_configuration_item_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_lov_ci_used_for_c a125 
 on (a12.ci_used_for_c_key = a125.row_key)  


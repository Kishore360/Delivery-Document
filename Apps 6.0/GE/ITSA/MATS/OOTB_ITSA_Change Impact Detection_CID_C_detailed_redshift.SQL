select 'ldb.f_change_incident_linkage a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 union
select 'ldb.d_change_incident_linkage a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
    on (a11.chg2inc_key = a12.row_key)  
 union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_calendar_date a13 
    on (a11.date_key = a13.row_key)  
 union
select 'ldb.d_change_request a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) 
    join ldb.d_change_request a14 
    on (a12.change_request_key = a14.row_key)  
 union
select 'ldb.d_change_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) join ldb.d_change_request a14 
 on (a12.change_request_key = a14.row_key) 
    join ldb.d_change_configuration_item a15 
    on (a14.configuration_item_key = a15.row_key)  
 union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) 
    join ldb.d_incident a16 
    on (a12.incident_key = a16.row_key)  
 union
select 'ldb.d_configuration_item_incident a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) join ldb.d_incident a16 
 on (a12.incident_key = a16.row_key) 
    join ldb.d_configuration_item_incident a17 
    on (a16.configuration_item_key = a17.row_key)  
 union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_internal_organization_group a18 
    on (a11.assignment_group_key = a18.row_key)  
 union
select 'ldb.d_assignment_group_manager a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_internal_organization_group a18 
 on (a11.assignment_group_key = a18.row_key) 
    join ldb.d_assignment_group_manager a19 
    on (a18.assignment_group_manager_key = a19.row_key)  
 union
select 'ldb.d_h_ag_manager a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_internal_organization_group a18 
 on (a11.assignment_group_key = a18.row_key) join ldb.d_assignment_group_manager a19 
 on (a18.assignment_group_manager_key = a19.row_key) 
    join ldb.d_h_ag_manager a110 
    on (a19.assignment_group_manager_hierarchy_key = a110.row_key)  
 union
select 'ldb.d_chg2inc_keywords_count a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) 
    join ldb.d_chg2inc_keywords_count a111 
    on (a12.common_keywords_bucket_key = a111.row_key)  
 union
select 'ldb.d_chg2inc_pair_possibility a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) 
    join ldb.d_chg2inc_pair_possibility a112 
    on (a12.pair_possibility_bucket_key = a112.row_key)  
 union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_calendar_date a13 
 on (a11.date_key = a13.row_key) 
    join ldb.d_calendar_week a113 
    on (a13.week_start_date_key = a113.row_key)  
 union
select 'ldb.d_chg2inc_days_difference a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) 
    join ldb.d_chg2inc_days_difference a114 
    on (a12.time_difference_bucket_key = a114.row_key)  
 union
select 'ldb.d_calendar_month a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_calendar_date a13 
 on (a11.date_key = a13.row_key) 
    join ldb.d_calendar_month a115 
    on (a13.month_start_date_key = a115.row_key)  
 union
select 'ldb.d_change_request_assignment_group a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) join ldb.d_change_request a14 
 on (a12.change_request_key = a14.row_key) 
    join ldb.d_change_request_assignment_group a116 
    on (a14.assignment_group_key = a116.row_key)  
 union
select 'ldb.d_change_configuration_item_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) join ldb.d_change_request a14 
 on (a12.change_request_key = a14.row_key) join ldb.d_change_configuration_item a15 
 on (a14.configuration_item_key = a15.row_key) 
    join ldb.d_change_configuration_item_mdm a117 
    on (a15.mdm_key = a117.row_key)  
 union
select 'ldb.d_incident_assignment_group a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) join ldb.d_incident a16 
 on (a12.incident_key = a16.row_key) 
    join ldb.d_incident_assignment_group a118 
    on (a16.assignment_group_key = a118.row_key)  
 union
select 'ldb.d_incident_configuration_item_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) join ldb.d_incident a16 
 on (a12.incident_key = a16.row_key) join ldb.d_configuration_item_incident a17 
 on (a16.configuration_item_key = a17.row_key) 
    join ldb.d_incident_configuration_item_mdm a119 
    on (a17.mdm_key = a119.row_key)  
 union
select 'ldb.d_incident_priority a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_change_incident_linkage a12 
 on (a11.chg2inc_key = a12.row_key) join ldb.d_incident a16 
 on (a12.incident_key = a16.row_key) 
    join ldb.d_incident_priority a120 
    on (a16.priority_src_key = a120.row_key)  
 union
select 'ldb.d_ag_manager_level_1 a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_internal_organization_group a18 
 on (a11.assignment_group_key = a18.row_key) join ldb.d_assignment_group_manager a19 
 on (a18.assignment_group_manager_key = a19.row_key) join ldb.d_h_ag_manager a110 
 on (a19.assignment_group_manager_hierarchy_key = a110.row_key) 
    join ldb.d_ag_manager_level_1 a121 
    on (a110.assignment_group_manager_level_1_key = a121.row_key)  
 union
select 'ldb.d_ag_manager_level_2 a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_internal_organization_group a18 
 on (a11.assignment_group_key = a18.row_key) join ldb.d_assignment_group_manager a19 
 on (a18.assignment_group_manager_key = a19.row_key) join ldb.d_h_ag_manager a110 
 on (a19.assignment_group_manager_hierarchy_key = a110.row_key) 
    join ldb.d_ag_manager_level_2 a122 
    on (a110.assignment_group_manager_level_2_key = a122.row_key)  
 union
select 'ldb.d_ag_manager_level_3 a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_internal_organization_group a18 
 on (a11.assignment_group_key = a18.row_key) join ldb.d_assignment_group_manager a19 
 on (a18.assignment_group_manager_key = a19.row_key) join ldb.d_h_ag_manager a110 
 on (a19.assignment_group_manager_hierarchy_key = a110.row_key) 
    join ldb.d_ag_manager_level_3 a123 
    on (a110.assignment_group_manager_level_3_key = a123.row_key)  
 union
select 'ldb.d_ag_manager_level_4 a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_internal_organization_group a18 
 on (a11.assignment_group_key = a18.row_key) join ldb.d_assignment_group_manager a19 
 on (a18.assignment_group_manager_key = a19.row_key) join ldb.d_h_ag_manager a110 
 on (a19.assignment_group_manager_hierarchy_key = a110.row_key) 
    join ldb.d_ag_manager_level_4 a124 
    on (a110.assignment_group_manager_level_4_key = a124.row_key)  
 union
select 'ldb.d_ag_manager_level_5 a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage a11 
 join ldb.d_internal_organization_group a18 
 on (a11.assignment_group_key = a18.row_key) join ldb.d_assignment_group_manager a19 
 on (a18.assignment_group_manager_key = a19.row_key) join ldb.d_h_ag_manager a110 
 on (a19.assignment_group_manager_hierarchy_key = a110.row_key) 
    join ldb.d_ag_manager_level_5 a125 
    on (a110.assignment_group_manager_level_5_key = a125.row_key) 
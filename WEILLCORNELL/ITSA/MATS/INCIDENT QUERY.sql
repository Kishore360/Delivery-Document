SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_legalentity       a12
on (a11.company_key = a12.row_key)
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_customer       a13
on (a11.customer_key = a13.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_department       a14
on (a11.opened_by_department_key = a14.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact       a15
on (a11.opened_by_key = a15.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_time       a16
on (a11.opened_time_key = a16.row_key)
union
select'ldb.d_department_hierarchies_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_department_hierarchies_c       a17
on (a11.opened_by_department_key = a17.lev_0_key)
union
select'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.dh_assignment_group_tier_hierarchy       a18
on (a11.assignment_group_key = a18.user_group_tier_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item       a19
on (a11.configuration_item_key = a19.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a110
on (a11.incident_key = a110.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date       a111
on (a11.opened_on_key = a111.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_location       a112
on (a11.location_key = a112.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a113
on (a11.assignment_group_key = a113.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact       a114
on (a11.assigned_to_key = a114.row_key)
union
select'ldb.d_configuration_item_bsd_business_service_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item_bsd_business_service_c       a115
on (a11.bsd_business_service_c_key = a115.row_key)
union
select'ldb.d_configuration_item_bsd_parent_business_service_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item_bsd_parent_business_service_c       a116
on (a11.bsd_parent_business_service_c_key = a116.row_key)
union
select'ldb.d_configuration_item_business_service_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item_business_service_c       a117
on (a11.business_service_c_key = a117.row_key)
union
select'ldb.d_configuration_item_client_asset_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item_client_asset_c       a118
on (a11.client_asset_c_key = a118.row_key)
union
select'ldb.d_configuration_item_closure_business_service_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item_closure_business_service_c       a119
on (a11.closure_business_service_c_key = a119.row_key)
union
select'ldb.d_closure_trouble_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_closure_trouble_c       a120
on (a11.closure_trouble_c_key = a120.row_key)
union

select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_customer a13 
 on (a11.customer_key = a13.row_key)
join ldb.d_customer_mdm       a121
on (a13.row_current_key = a121.row_current_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_category       a124
on (a11.category_src_key = a124.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_close_code       a125
on (a11.close_code_src_key = a125.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_severity       a126
on (a11.severity_src_key = a126.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_state       a127
on (a11.state_src_key = a127.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_subcategory       a128
on (a11.sub_category_src_key = a128.row_key)
union
select'ldb.d_internal_contact_person_reporting_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_person_reporting_c       a130
on (a11.person_reporting_c_key = a130.row_key)
union
select'ldb.d_record_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_record_type_c       a131
on (a11.record_type_c_key = a131.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_impact       a132
on (a11.impact_src_key = a132.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_priority       a133
on (a11.priority_src_key = a133.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_contacttype       a134
on (a11.reported_type_src_key = a134.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_urgency       a135
on (a11.urgency_src_key = a135.row_key)
union
select'ldb.d_trouble_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_trouble_c       a136
on (a11.trouble_c_key = a136.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_contact	       a15
on (a11.opened_by_key = a15.row_key)
join ldb.d_internal_contact_mdm       a123
on (a15.row_current_key = a123.row_current_key)
union
select'ldb.d_internal_organization_institution_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_department_hierarchies_c	       a17
on (a11.opened_by_department_key = a17.lev_0_key)
join ldb.d_internal_organization_institution_c       a129
on (a17.lev_1_key = a129.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date	       a111
on (a11.opened_on_key = a111.row_key)
join ldb.d_calendar_month       a137
on (a111.month_start_date_key = a137.row_key)
)a
)b
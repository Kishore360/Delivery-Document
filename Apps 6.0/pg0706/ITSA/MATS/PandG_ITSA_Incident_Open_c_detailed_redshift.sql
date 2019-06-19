select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 on (a11.customer_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 on (a11.employee_key = a13.row_key) 
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a14 on (a11.date_key = a14.row_key) 
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 on (a11.time_key = a15.row_key) 
union
select 'ldb.d_ag_manager_role_vp_dir_ad_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a16 
on (a11.inc_assignment_group_key = a16.internal_organization_key) 
union
select 'ldb.d_internal_contact_associate_director_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a16 on (a11.inc_assignment_group_key = a16.internal_organization_key) 
join ldb.d_internal_contact_associate_director_c a17 on (a16.associate_director_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a18 on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a19 on (a11.assigned_to_key = a19.row_key) 
union
select 'ldb.d_business_service a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 on (a11.business_service_key = a110.row_key) 
union
select 'ldb.d_calendar_date a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 on (a11.date_key = a111.row_key) 
union
select 'ldb.d_change_request a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a112 on (a11.change_request_key = a112.row_key) 
union
select 'ldb.d_configuration_item a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a113 on (a11.configuration_item_key = a113.row_key) 
union
select 'ldb.d_incident a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 on (a11.incident_key = a114.row_key) 
union
select 'ldb.d_internal_contact_director_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a16 on (a11.inc_assignment_group_key = a16.internal_organization_key) 
join ldb.d_internal_contact_director_c a115 on (a16.director_key = a115.row_key) 
union
select 'ldb.d_calendar_month a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 on (a11.date_key = a111.row_key) 
join ldb.d_calendar_month a116 on (a111.month_start_date_key = a116.row_key) 
union
select 'ldb.d_parent_incident a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 on (a11.incident_key = a114.row_key) 
join ldb.d_parent_incident a117 on (a114.parent_incident_key = a117.row_key) 
union
select 'ldb.d_location a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a118 on (a11.location_key = a118.row_key) 
union
select 'ldb.d_business_service_parent_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_parent_c a119 on (a110.parent_business_service_c_key = a119.row_key) 
union
select 'ldb.d_internal_contact_vp_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a16 on (a11.inc_assignment_group_key = a16.internal_organization_key) 
join ldb.d_internal_contact_vp_c a120 on (a16.vp_key = a120.row_key) 
union
select 'ldb.d_change_request_caused_by a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a121 
on (a11.caused_by_change_key = a121.row_key) 
union
select 'ldb.d_internal_organization_legalentity a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a122 
on (a11.company_key = a122.row_key) 
union
select 'ldb.d_customer_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a123 on (a12.row_current_key = a123.row_current_key) 
union
select 'ldb.d_internal_organization_department a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 on (a11.employee_key = a13.row_key) 
join ldb.d_internal_organization_department a124 on (a13.department_key = a124.row_key) 
union
select 'ldb.d_domain a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a125 
on (a11.domain_key = a125.row_key) 
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 on (a11.employee_key = a13.row_key) 
join ldb.d_internal_contact_mdm a126 on (a13.row_current_key = a126.row_current_key) 
union
select 'ldb.d_calendar_fiscal_quarter a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a14 on (a11.fiscal_date_key = a14.row_key) 
join ldb.d_calendar_fiscal_quarter a127 on (a14.quarter_start_date_key = a127.row_key) 
union
select 'ldb.d_calendar_time_hour a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 ON a11.time_key=a15.row_key
join ldb.d_calendar_time_hour a128 ON a15.hour_24_format_char=a128.hour_24_format_char
union
select 'ldb.d_incident_contacttype a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a129 on (a11.reported_type_src_key = a129.row_key) 
union
select 'ldb.d_incident_impact a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a130 on (a11.impact_src_key = a130.row_key) 
union
select 'ldb.d_incident_urgency a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a131 on (a11.urgency_src_key = a131.row_key) 
union
select 'ldb.d_configuration_item_incident_service_offering_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item_incident_service_offering_c a132 
on (a11.service_offering_c_key = a132.row_key) 
union
select 'ldb.d_business_service_criticality a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_criticality a133 on (a110.criticality_key = a133.row_key) 
union
select 'ldb.d_business_service_used_for a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_used_for a134 on (a110.used_for_src_key = a134.row_key) 
union
select 'ldb.d_calendar_week a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 on (a11.date_key = a111.row_key) 
join ldb.d_calendar_week a135 on (a111.week_start_date_key = a135.row_key) 
union
select 'ldb.d_calendar_fiscal_year d ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_calendar_date_fiscal b ON a11.fiscal_date_key=b.row_key
JOIN ldb.d_calendar_fiscal_quarter c ON b.quarter_start_date_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d on C.year_start_date_key=d.row_key
union
select 'ldb.d_incident_category a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 on (a11.incident_key = a114.row_key) 
join ldb.d_incident_category a137 on (a114.category_src_key = a137.row_key) 
union
select 'ldb.d_incident_close_code a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 on (a11.incident_key = a114.row_key) 
join ldb.d_incident_close_code a138 on (a114.close_code_src_key = a138.row_key) 
union
select 'ldb.d_incident_opened_by a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 on (a11.incident_key = a114.row_key) 
join ldb.d_incident_opened_by a139 on (a114.opened_by_key = a139.row_key) 
union
select 'ldb.d_incident_priority a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 on (a11.incident_key = a114.row_key) 
join ldb.d_incident_priority a140 on (a114.priority_src_key = a140.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 on (a11.incident_key = a114.row_key) 
join ldb.d_task_sla_resolution_flag a141 on (a114.met_resolution_sla_flag_key = a141.row_key) 
union
select 'ldb.d_task_sla_response_flag a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_task_sla_response_flag a142 
on (a114.met_response_sla_flag_key = a142.row_key) 
union
select 'ldb.d_incident_severity a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_incident_severity a143 
on (a114.severity_src_key = a143.row_key) 
union
select 'ldb.d_incident_state a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_incident_state a144 
on (a114.state_src_key = a144.row_key) 
union
select 'ldb.d_incident_subcategory a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_incident_subcategory a145 
on (a114.sub_category_src_key = a145.row_key) 
union
select 'ldb.d_lov_incident_incident_type_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_lov_incident_incident_type_c a146 
on (a114.incident_type_src_c_key = a146.row_key) 
union
select 'ldb.d_internal_contact_incident_opened_for_c a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 on (a11.incident_key = a114.row_key) 
join ldb.d_internal_contact_incident_opened_for_c a147 on (a114.opened_for_key = a147.row_key) 
union
select 'ldb.d_lov_incident_service_type_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 on (a11.incident_key = a114.row_key) 
join ldb.d_lov_incident_service_type_c a148 on (a114.service_type_src_c_key = a148.row_key) 
union
select 'ldb.d_lov_incident_why_not_cwt_c a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 on (a11.incident_key = a114.row_key) 
join ldb.d_lov_incident_why_not_cwt_c a149 on (a114.why_now_cwt_src_c_key = a149.row_key) 
union
select 'ldb.d_calendar_quarter a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) 
JOIN ldb.d_calendar_month a12 ON a111.month_start_date_key=a12.row_key
JOIN ldb.d_calendar_quarter a13 ON a12.quarter_start_date_key=a13.row_key
union
select 'ldb.d_business_service_grand_parent_c a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) join ldb.d_business_service_parent_c a119 
on (a110.parent_business_service_c_key = a119.row_key) 
join ldb.d_business_service_grand_parent_c a151 
on (a119.parent_business_service_c_key = a151.row_key) 
union
select 'ldb.d_calendar_year a14' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) 
JOIN ldb.d_calendar_month a12 ON a111.month_start_date_key=a12.row_key
JOIN ldb.d_calendar_quarter a13 ON a12.quarter_start_date_key=a13.row_key
JOIN ldb.d_calendar_year a14 ON a13.year_start_date_key=a14.row_key
UNION 
select 'ldb.d_lov_incremental_cost_c a150' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 on (a11.incident_key = a114.row_key) 
JOIN ldb.d_lov_incremental_cost_c a150 ON a114.incremental_cost_src_c_key=a150.row_key

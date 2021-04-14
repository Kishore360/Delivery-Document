/* Tables Accessed:
d_application
d_application_mdm
d_business_service
d_business_service_business_channel_c
d_business_service_criticality
d_business_service_support_group_c
d_business_service_used_for
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_time
d_calendar_time_hour
d_calendar_week
d_calendar_year
d_change_request
d_configuration_item
d_configuration_item_mdm
d_incident_alert_c
d_internal_contact
d_internal_contact_assigned_to
d_internal_contact_mdm
d_internal_contact_problem_director_c
d_internal_contact_problem_svp_c
d_internal_contact_problem_vp_c
d_internal_organization_department
d_internal_organization_group
d_location
d_location_assigned_to
d_lov_employee_type_c
d_lov_problem_avoidability_c
d_lov_problem_avoidability_category_c
d_lov_problem_caused_by_change_c
d_lov_problem_detection_method_c
d_lov_problem_failed_component_c
d_lov_problem_sdlc_prevention_activity_c
d_problem
d_problem_enterprise_incident_c
d_problem_priority
d_problem_reported_type
d_problem_responsible_group_c
d_problem_root_cause_responsibility_c
d_problem_state
d_problem_urgency
d_problem_vendor_c
f_problem */


select 'ldb."f_problem" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_application" a12 
	on (a11.application_key = a12.row_key)  
 union
select 'ldb."d_internal_contact_assigned_to" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_internal_contact_assigned_to" a13 
	on (a11.assigned_to_key = a13.row_key)  
 union
select 'ldb."d_internal_organization_group" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_internal_organization_group" a14 
	on (a11.assignment_group_key = a14.row_key)  
 union
select 'ldb."d_business_service" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_business_service" a15 
	on (a11.business_service_key = a15.row_key)  
 union
select 'ldb."d_calendar_date" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_calendar_date" a16 
	on (a11.date_key = a16.row_key)  
 union
select 'ldb."d_calendar_month" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) 
	join "ldb"."d_calendar_month" a17 
	on (a16.month_start_date_key = a17.row_key)  
 union
select 'ldb."d_calendar_quarter" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) join "ldb"."d_calendar_month" a17 
 on (a16.month_start_date_key = a17.row_key) 
	join "ldb"."d_calendar_quarter" a18 
	on (a17.quarter_start_date_key = a18.row_key)  
 union
select 'ldb."d_configuration_item" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_configuration_item" a19 
	on (a11.configuration_item_key = a19.row_key)  
 union
select 'ldb."d_configuration_item_mdm" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_configuration_item" a19 
 on (a11.configuration_item_key = a19.row_key) 
	join "ldb"."d_configuration_item_mdm" a110 
	on (a19.mdm_key = a110.row_key)  
 union
select 'ldb."d_internal_contact" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_internal_contact" a111 
	on (a11.employee_key = a111.row_key)  
 union
select 'ldb."d_problem" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
	on (a11.problem_key = a112.row_key)  
 union
select 'ldb."d_incident_alert_c" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) 
	join "ldb"."d_incident_alert_c" a113 
	on (a112.incident_alert_c_key = a113.row_key)  
 union
select 'ldb."d_calendar_time" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_calendar_time" a114 
	on (a11.time_key = a114.row_key)  
 union
select 'ldb."d_calendar_week" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) 
	join "ldb"."d_calendar_week" a115 
	on (a16.week_start_date_key = a115.row_key)  
 union
select 'ldb."d_calendar_year" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) join "ldb"."d_calendar_month" a17 
 on (a16.month_start_date_key = a17.row_key) join "ldb"."d_calendar_quarter" a18 
 on (a17.quarter_start_date_key = a18.row_key) 
	join "ldb"."d_calendar_year" a116 
	on (a18.year_start_date_key = a116.row_key)  
 union
select 'ldb."d_problem_responsible_group_c" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) 
	join "ldb"."d_problem_responsible_group_c" a117 
	on (a112.problem_responsible_group_c_key = a117.row_key)  
 union
select 'ldb."d_problem_enterprise_incident_c" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem_enterprise_incident_c" a118 
	on (a11.problem_enterprise_incident_c_key = a118.row_key)  
 union
select 'ldb."d_change_request" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_change_request" a119 
	on (a11.change_request_key = a119.row_key)  
 union
select 'ldb."d_location" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_location" a120 
	on (a11.location_key = a120.row_key)  
 union
select 'ldb."d_problem_reported_type" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem_reported_type" a121 
	on (a11.reported_type_src_key = a121.row_key)  
 union
select 'ldb."d_problem_priority" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem_priority" a122 
	on (a11.priority_src_key = a122.row_key)  
 union
select 'ldb."d_problem_root_cause_responsibility_c" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem_root_cause_responsibility_c" a123 
	on (a11.problem_root_cause_responsibility_c_key = a123.row_key)  
 union
select 'ldb."d_problem_urgency" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem_urgency" a124 
	on (a11.urgency_src_key = a124.row_key)  
 union
select 'ldb."d_application_mdm" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_application" a12 
 on (a11.application_key = a12.row_key) 
	join "ldb"."d_application_mdm" a125 
	on (a12.mdm_key = a125.row_key)  
 union
select 'ldb."d_location_assigned_to" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_internal_contact_assigned_to" a13 
 on (a11.assigned_to_key = a13.row_key) 
	join "ldb"."d_location_assigned_to" a126 
	on (a13.location_key = a126.row_key)  
 union
select 'ldb."d_business_service_business_channel_c" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_business_service" a15 
 on (a11.business_service_key = a15.row_key) 
	join "ldb"."d_business_service_business_channel_c" a127 
	on (a15.service_business_channel_src_c = a127.row_key)  
 union
select 'ldb."d_business_service_criticality" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_business_service" a15 
 on (a11.business_service_key = a15.row_key) 
	join "ldb"."d_business_service_criticality" a128 
	on (a15.criticality_key = a128.row_key)  
 union
select 'ldb."d_business_service_support_group_c" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_business_service" a15 
 on (a11.business_service_key = a15.row_key) 
	join "ldb"."d_business_service_support_group_c" a129 
	on (a15.support_group_c = a129.row_key)  
 union
select 'ldb."d_business_service_used_for" a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_business_service" a15 
 on (a11.business_service_key = a15.row_key) 
	join "ldb"."d_business_service_used_for" a130 
	on (a15.used_for_src_key = a130.row_key)  
 union
select 'ldb."d_internal_organization_department" a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_internal_contact" a111 
 on (a11.employee_key = a111.row_key) 
	join "ldb"."d_internal_organization_department" a131 
	on (a111.department_key = a131.row_key)  
 union
select 'ldb."d_internal_contact_mdm" a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_internal_contact" a111 
 on (a11.employee_key = a111.row_key) 
	join "ldb"."d_internal_contact_mdm" a132 
	on (a111.employee_mdm_key = a132.row_key)  
 union
select 'ldb."d_lov_employee_type_c" a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_internal_contact_assigned_to" a13 
 on (a11.assigned_to_key = a13.row_key) 
	join "ldb"."d_lov_employee_type_c" a133 
	on (a13.employee_type_c_key = a133.row_key)  
 union
select 'ldb."d_calendar_time_hour" a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_calendar_time" a114 
 on (a11.time_key = a114.row_key) 
	join "ldb"."d_calendar_time_hour" a134 
	on (a114.hour_key = a134.row_key)  
 union
select 'ldb."d_lov_problem_avoidability_c" a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) 
	join "ldb"."d_lov_problem_avoidability_c" a135 
	on (a112.u_avoidability_c_key = a135.row_key)  
 union
select 'ldb."d_lov_problem_avoidability_category_c" a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) 
	join "ldb"."d_lov_problem_avoidability_category_c" a136 
	on (a112.u_avoidability_category_c_key = a136.row_key)  
 union
select 'ldb."d_lov_problem_caused_by_change_c" a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) 
	join "ldb"."d_lov_problem_caused_by_change_c" a137 
	on (a112.u_problem_caused_by_change_c_key = a137.row_key)  
 union
select 'ldb."d_lov_problem_detection_method_c" a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) 
	join "ldb"."d_lov_problem_detection_method_c" a138 
	on (a112.u_detection_method_c_key = a138.row_key)  
 union
select 'ldb."d_lov_problem_failed_component_c" a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) 
	join "ldb"."d_lov_problem_failed_component_c" a139 
	on (a112.u_failed_component_c_key = a139.row_key)  
 union
select 'ldb."d_lov_problem_sdlc_prevention_activity_c" a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) 
	join "ldb"."d_lov_problem_sdlc_prevention_activity_c" a140 
	on (a112.u_sdlc_prevention_activity_c_key = a140.row_key)  
 union
select 'ldb."d_problem_state" a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) 
	join "ldb"."d_problem_state" a141 
	on (a112.state_src_key = a141.row_key)  
 union
select 'ldb."d_problem_vendor_c" a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) 
	join "ldb"."d_problem_vendor_c" a142 
	on (a112.problem_vendor_c_key = a142.row_key)  
 union
select 'ldb."d_internal_contact_problem_director_c" a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) join "ldb"."d_problem_responsible_group_c" a117 
 on (a112.problem_responsible_group_c_key = a117.row_key) 
	join "ldb"."d_internal_contact_problem_director_c" a143 
	on (a117.problem_director_c_key = a143.row_key)  
 union
select 'ldb."d_internal_contact_problem_svp_c" a144 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) join "ldb"."d_problem_responsible_group_c" a117 
 on (a112.problem_responsible_group_c_key = a117.row_key) 
	join "ldb"."d_internal_contact_problem_svp_c" a144 
	on (a117.problem_svp_c_key = a144.row_key)  
 union
select 'ldb."d_internal_contact_problem_vp_c" a145 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem" a11 
 join "ldb"."d_problem" a112 
 on (a11.problem_key = a112.row_key) join "ldb"."d_problem_responsible_group_c" a117 
 on (a112.problem_responsible_group_c_key = a117.row_key) 
	join "ldb"."d_internal_contact_problem_vp_c" a145 
	on (a117.problem_vp_c_key = a145.row_key) 


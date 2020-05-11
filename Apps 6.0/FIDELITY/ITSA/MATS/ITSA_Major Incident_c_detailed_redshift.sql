select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_application_mdm a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a13
on (a12.mdm_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
union
select 'ldb.d_configuration_item_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
join ldb.d_configuration_item_mdm a111
on (a110.mdm_key = a111.row_key)
union
select 'ldb.d_internal_contact a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a112
on (a11.employee_key = a112.row_key)
union
select 'ldb.d_internal_contact_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a112
on (a11.employee_key = a112.row_key)
join ldb.d_internal_contact_mdm a113
on (a112.employee_mdm_key = a113.row_key)
union
select 'ldb.d_customer a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a114
on (a11.customer_key = a114.row_key)
union
select 'ldb.d_fmr_product_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_application_mdm a13
on (a12.mdm_key = a13.row_key)
join ldb.d_fmr_product_c a115
on (a13.fmr_product_c_key = a115.row_key)
union
select 'ldb.d_fmr_product_line_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_application_mdm a13
on (a12.mdm_key = a13.row_key) join ldb.d_fmr_product_c a115
on (a13.fmr_product_c_key = a115.row_key)
join ldb.d_fmr_product_line_c a116
on (a115.fmr_product_line_c_key = a116.row_key)
union
select 'ldb.d_incident_application_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_application_c a117
on (a16.application_c_key = a117.row_key)
union
select 'ldb.d_incident_assignment_group_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_assignment_group_c a118
on (a16.assignment_group_c_key = a118.row_key)
union
select 'ldb.d_incident_configuration_item_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_configuration_item_c a119
on (a16.configuration_item_c_key = a119.row_key)
union
select 'ldb.d_parent_incident a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_parent_incident a120
on (a16.parent_incident_key = a120.row_key)
union
select 'ldb.d_problem a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a121
on (a11.problem_key = a121.row_key)
union
select 'ldb.d_change_request_caused_by a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request_caused_by a122
on (a11.caused_by_change_key = a122.row_key)
union
select 'ldb.d_internal_organization_legalentity a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_legalentity a123
on (a11.company_key = a123.row_key)
union
select 'ldb.d_domain a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_domain a124
on (a11.domain_key = a124.row_key)
union
select 'ldb.d_incident_contacttype a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_contacttype a125
on (a11.reported_type_src_key = a125.row_key)
union
select 'ldb.d_incident_impact a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_impact a126
on (a11.impact_src_key = a126.row_key)
union
select 'ldb.d_internal_contact_major_incident_manager_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_major_incident_manager_c a127
on (a11.major_incident_manager_c_key = a127.row_key)
union
select 'ldb.d_incident_urgency a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_urgency a128
on (a11.urgency_src_key = a128.row_key)
union
select 'ldb.d_location a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_location a129
on (a11.location_key = a129.row_key)
union
select 'ldb.d_internal_contact_on_behalf_of_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_on_behalf_of_c a130
on (a11.on_behalf_of_c_key = a130.row_key)
union
select 'ldb.d_calendar_week a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a131
on (a17.week_start_date_key = a131.row_key)
union
select 'ldb.d_customer_mdm a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a114
on (a11.customer_key = a114.row_key)
join ldb.d_customer_mdm a132
on (a114.customer_mdm_key = a132.row_key)
union
select 'ldb.d_lov_incident_discovery_method_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_lov_incident_discovery_method_c a133
on (a16.discovery_method_src_c_key = a133.row_key)
union
select 'ldb.d_lov_incident_environment_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_lov_incident_environment_c a134
on (a16.environment_src_c_key = a134.row_key)
union
select 'ldb.d_lov_incident_impacted_audience_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_lov_incident_impacted_audience_c a135
on (a16.impacted_audience_src_c_key = a135.row_key)
union
select 'ldb.d_incident_caller a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_caller a136
on (a16.caller_key = a136.row_key)
union
select 'ldb.d_incident_category a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_category a137
on (a16.category_src_key = a137.row_key)
union
select 'ldb.d_incident_close_code a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_close_code a138
on (a16.close_code_src_key = a138.row_key)
union
select 'ldb.d_incident_priority a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_priority a139
on (a16.priority_src_key = a139.row_key)
union
select 'ldb.d_task_sla_resolution_flag a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_task_sla_resolution_flag a140
on (a16.met_resolution_sla_flag_key = a140.row_key)
union
select 'ldb.d_task_sla_response_flag a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_task_sla_response_flag a141
on (a16.met_response_sla_flag_key = a141.row_key)
union
select 'ldb.d_incident_severity a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_severity a142
on (a16.severity_src_key = a142.row_key)
union
select 'ldb.d_incident_state a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_state a143
on (a16.state_src_key = a143.row_key)
union
select 'ldb.d_incident_subcategory a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_subcategory a144
on (a16.sub_category_src_key = a144.row_key)
union
select 'ldb.d_lov_incident_loss_of_service_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_lov_incident_loss_of_service_c a145
on (a16.loss_of_service_src_c_key = a145.row_key)
union
select 'ldb.d_internal_organization_originating_group_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_internal_organization_originating_group_c a146
on (a16.originating_group_c_key = a146.row_key)
union
select 'ldb.d_lov_vendor_related_c a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_lov_vendor_related_c a147
on (a16.vendor_related_c_key = a147.row_key)
union
select 'ldb.d_calendar_year a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a148
on (a19.year_start_date_key = a148.row_key)
union
select 'ldb.d_internal_contact_service_offering_manager_c a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_application_mdm a13
on (a12.mdm_key = a13.row_key) join ldb.d_fmr_product_c a115
on (a13.fmr_product_c_key = a115.row_key)
join ldb.d_internal_contact_service_offering_manager_c a149
on (a115.service_offering_manager_c_key = a149.row_key)
union
select 'ldb.d_internal_contact_business_service_manager_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_application_mdm a13
on (a12.mdm_key = a13.row_key) join ldb.d_fmr_product_c a115
on (a13.fmr_product_c_key = a115.row_key) join ldb.d_fmr_product_line_c a116
on (a115.fmr_product_line_c_key = a116.row_key)
join ldb.d_internal_contact_business_service_manager_c a150
on (a116.business_service_manager_c_key = a150.row_key)
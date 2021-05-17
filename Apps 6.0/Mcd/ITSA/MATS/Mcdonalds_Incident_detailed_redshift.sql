-- DELV-17544  - Need to exclude these assingment groups -- 
-- DELV-20066  -the cubes contain other filter Domain as Global corporate --

 'XRX/BRIDGE','MCD/SUPPLY CHAIN MASTER DATA L4 SUPPORT','MCD/GROIP L3 CA','MCD/RS RFM GCOE','Middleware L3 Mulesoft','CS/SD/RTPAAS/SCCM/L3/MCD','MCD/RS L3 RIDM US',
'CS/OE/SERVER ADMIN/MCD','MCD/GDW GBL SUPPORT','MCD/RS CM US RFM','MCD/CA OurLounge Support T2','MCD/GDW ITEM MASTER SUPPORT','ACCO/ACS/3RD LEVEL ORACLE/SQL DATABASE S','NewPOS Team',
'CS/SD/PORTAL ENGINEERING/MCD','CS/GSD/SE/OSE/LINUX/MCDONALDS','MCD/GENESIS','McWeb Support CA','MBS SUPPORT - IT CORE','MCD/EAI L2 ES','MCD/EAI L2 DE','AccessMcD Support',
'MCD/GROIP L2 CA','MCD/GDW INFRASTRUCTURE DBA-L2','MCD/TWK-BUSINESS','MCD/RS L1 RIDM US','Field Services','Service Café Enhancement','RS IT Delivery RTPaaS EU APMEA','MCD/RS L4 VERIFONE',
'MCD/MERLIN L4 ORACLE','MCD/ITF GLOBAL ACCOUNT PORTAL SUPPORT','MCD/TLD-SUPPORT','CS/OE/USERACCESS/APPCAT/MCD','MTM Data Support','MCD/RS L4 RIDM','Service Desk Level 1',
'MCD/RS RFM2 DEPLOYMENT','MCD/MERLIN L2 AR','MCD/GLMS L3 TECHNICAL','MCD/RS RTPAAS CHANGE MGMT','MCD/RS L3 LATAM RDI','MCD/GLOBAL HRMS TECH SUPPORT','MCD/RS L3 AP FAST',
'MCD/DATAPIPE','CS/OE/USERACCESS/SIMSYSTEMADMIN/MCD','EASS /DSS Cassandra DBA Support','Back Office','Virtual Provisioning Cloud Administrators','MCD/CANADA','XRX/ITSD - L1',
'MCD/COMPASS','MCD/RS L3 EU TECH SERVICES','MCD/US IT SECURITY','RTPaaS RSM L3 Support','MicroServices Support','MCD/X-APPS','MCD/CA Restaurant Application Development L3','Datavail Corp DB Admin','CA Migration',
'ECP ID','MCD/GBS-People',

select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a12
on (a11.customer_key = a12.row_key)
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a13
on (a11.opened_by_key = a13.row_key)
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a14
on (a11.opened_time_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_assigned_to a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
union
select 'ldb.d_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a19
on (a11.opened_on_key = a19.row_key)
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
union
select 'ldb.d_incident_priority a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_priority a111
on (a17.priority_src_key = a111.row_key)
union
select 'ldb.d_calendar_week a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a19
on (a11.opened_on_key = a19.row_key)
join ldb.d_calendar_week a112
on (a19.week_start_date_key = a112.row_key)
union
select 'ldb.d_calendar_year a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a19
on (a11.opened_on_key = a19.row_key)
join ldb.d_calendar_year a113
on (a19.year_start_date_key = a113.row_key)
union
select 'ldb.d_calendar_month a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a19
on (a11.opened_on_key = a19.row_key)
join ldb.d_calendar_month a114
on (a19.month_start_date_key = a114.row_key)
union
select 'ldb.d_internal_contact_incident_reported_by_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_incident_reported_by_c a115
on (a11.opened_by_key = a115.row_key)
union
select 'ldb.d_businessunit_custom_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_businessunit_custom_c a116
on (a11.businessunit_custom_c_key = a116.row_key)
union
select 'ldb.d_change_request_caused_by a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request_caused_by a117
on (a11.caused_by_change_key = a117.row_key)
union
select 'ldb.d_change_request a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request a118
on (a11.change_request_key = a118.row_key)
union
select 'ldb.d_internal_organization_legalentity a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_legalentity a119
on (a11.company_key = a119.row_key)
union
select 'ldb.d_customer_mdm a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a12
on (a11.customer_key = a12.row_key)
join ldb.d_customer_mdm a120
on (a12.row_current_key = a120.row_current_key)
union
select 'ldb.d_internal_organization_department a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a13
on (a11.opened_by_key = a13.row_key)
join ldb.d_internal_organization_department a121
on (a13.department_key = a121.row_key)
union
select 'ldb.d_domain a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_domain a122
on (a11.domain_key = a122.row_key)
union
select 'ldb.d_internal_contact_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a13
on (a11.opened_by_key = a13.row_key)
join ldb.d_internal_contact_mdm a123
on (a13.row_current_key = a123.row_current_key)
union
select 'ldb.d_calendar_time_hour a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a14
on (a11.opened_time_key = a14.row_key)
join ldb.d_calendar_time_hour a124
on (a14.hour_24_format_num = a124.hour_24_format_num)
union
select 'ldb.d_internal_contact_incident_closed_by_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_incident_closed_by_c a125
on (a11.closed_by_key = a125.row_key)
union
select 'ldb.d_incident_contacttype a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_contacttype a126
on (a11.reported_type_src_key = a126.row_key)
union
select 'ldb.d_incident_impact a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_impact a127
on (a11.impact_src_key = a127.row_key)
union
select 'ldb.d_internal_contact_opened_by_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_opened_by_c a128
on (a11.opened_by_c_key = a128.row_key)
union
select 'ldb.d_incident_urgency a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_urgency a129
on (a11.urgency_src_key = a129.row_key)
union
select 'ldb.d_request_item_original_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_request_item_original_c a130
on (a11.original_request_item_c_key = a130.row_key)
union
select 'ldb.d_problem a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a131
on (a11.problem_key = a131.row_key)
union
select 'ldb.d_scafe_core_realm_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_scafe_core_realm_c a132
on (a11.scafe_core_realm_c_key = a132.row_key)
union
select 'ldb.d_internal_contact a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a133
on (a11.last_resolved_by_key = a133.row_key)
union
select 'ldb.d_lov_incident_u_subcategory_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_lov_incident_u_subcategory_c a134
on (a11.subcategory_lov_c_key = a134.row_key)
union
select 'ldb.d_location a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_location a135
on (a11.location_key = a135.row_key)
union
select 'ldb.d_internal_contact_assignment_group_manager_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
join ldb.d_internal_contact_assignment_group_manager_c a136
on (a16.manager_c_key = a136.row_key)
union
select 'ldb.d_lov_service_access_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
join ldb.d_lov_service_access_c a137
on (a18.access_c_key = a137.row_key)
union
select 'ldb.d_business_service_criticality a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
join ldb.d_business_service_criticality a138
on (a18.criticality_key = a138.row_key)
union
select 'ldb.d_internal_contact_service_owned_by_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
join ldb.d_internal_contact_service_owned_by_c a139
on (a18.owned_by_c_key = a139.row_key)
union
select 'ldb.d_business_service_used_for a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
join ldb.d_business_service_used_for a140
on (a18.used_for_src_key = a140.row_key)
union
select 'ldb.d_internal_organization_vendor_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
join ldb.d_internal_organization_vendor_c a141
on (a16.vendor_c_key = a141.row_key)
union
select 'ldb.d_incident_category a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_category a142
on (a17.category_src_key = a142.row_key)
union
select 'ldb.d_incident_close_code a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_close_code a143
on (a17.close_code_src_key = a143.row_key)
union
select 'ldb.d_lov_incident_legacy_ci_name_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_lov_incident_legacy_ci_name_c a144
on (a17.legacy_ci_name_c_key = a144.row_key)
union
select 'ldb.d_lov_incident_pending_reason_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_lov_incident_pending_reason_c a145
on (a17.pending_reason_c_key = a145.row_key)
union
select 'ldb.d_task_sla_resolution_flag a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_task_sla_resolution_flag a146
on (a17.met_resolution_sla_flag_key = a146.row_key)
union
select 'ldb.d_task_sla_response_flag a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_task_sla_response_flag a147
on (a17.met_response_sla_flag_key = a147.row_key)
union
select 'ldb.d_incident_severity a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_severity a148
on (a17.severity_src_key = a148.row_key)
union
select 'ldb.d_incident_state a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_state a149
on (a17.state_src_key = a149.row_key)
union
select 'ldb.d_lov_incident_type_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_lov_incident_type_c a150
on (a17.incident_type_c_key = a150.row_key)
union
select 'ldb.d_lov_incident_workplace_location_c a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_lov_incident_workplace_location_c a151
on (a17.workplace_location_c_key = a151.row_key)
union
select 'ldb.d_service_incident_neva_subcategory_c a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_service_incident_neva_subcategory_c a152
on (a17.neva_subcategory_c_key = a152.row_key)
union
select 'ldb.d_lov_incident_situation_c a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a17
on (a11.incident_key = a17.row_key)
join ldb.d_lov_incident_situation_c a153
on (a17.situation_c_key = a153.row_key)
union
select 'ldb.d_calendar_quarter a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a19
on (a11.opened_on_key = a19.row_key)
join ldb.d_calendar_quarter a154
on (a19.quarter_start_date_key = a154.row_key)
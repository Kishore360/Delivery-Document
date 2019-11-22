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

select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact a12
on (a11.opened_by_key = a12.row_key)
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.dh_user_group_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
join ldb.dh_user_group_hierarchy a16
on (a15.row_dn_key = a16.lev_0_key)
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a17
on (a11.business_service_c_key = a17.row_key)
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
union
select 'ldb.d_change_request_risk a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_risk a19
on (a11.risk_src_key = a19.row_key)
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
union
select 'ldb.d_change_request_approval a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_approval a111
on (a11.approval_state_src_key = a111.row_key)
union
select 'ldb.d_internal_contact_change_approver_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact_change_approver_c a112
on (a11.change_approver_c_key = a112.row_key)
union
select 'ldb.d_change_request_category a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_category a113
on (a11.category_src_key = a113.row_key)
union
select 'ldb.d_change_request_reported_type a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_reported_type a114
on (a11.reported_type_src_key = a114.row_key)
union
select 'ldb.d_change_request_impact a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_impact a115
on (a11.impact_src_key = a115.row_key)
union
select 'ldb.d_change_request_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_priority a116
on (a11.priority_src_key = a116.row_key)
union
select 'ldb.d_change_request_reason a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_reason a117
on (a11.reason_src_key = a117.row_key)
union
select 'ldb.d_change_request_review_status a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_review_status a118
on (a11.review_status_src_key = a118.row_key)
union
select 'ldb.d_change_request_scope a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_scope a119
on (a11.scope_src_key = a119.row_key)
union
select 'ldb.d_change_request_state a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_state a120
on (a11.state_src_key = a120.row_key)
union
select 'ldb.d_change_request_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_type a121
on (a11.type_src_key = a121.row_key)
union
select 'ldb.d_change_request_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_urgency a122
on (a11.urgency_src_key = a122.row_key)
union
select 'ldb.d_change_request_data_ceneter_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_data_ceneter_c a123
on (a11.data_center_c_key = a123.row_key)
union
select 'ldb.d_internal_organization_department a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_department a124
on (a11.requested_by_department_key = a124.row_key)
union
select 'ldb.d_domain a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_domain a125
on (a11.domain_key = a125.row_key)
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm a126
on (a12.row_current_key = a126.row_current_key)
union
select 'ldb.d_location a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_location a127
on (a11.location_key = a127.row_key)
union
select 'ldb.d_scafe_core_realm_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_scafe_core_realm_c a128
on (a11.scafe_core_realm_c_key = a128.row_key)
union
select 'ldb.d_change_request_standard_change_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_standard_change_c a129
on (a11.standard_change_c_key = a129.row_key)
union
select 'ldb.d_change_request_third_party_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_third_party_c a130
on (a11.third_party_c_key = a130.row_key)
union
select 'ldb.d_lov_change_request_affected_environment_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_lov_change_request_affected_environment_c a131
on (a13.affected_environment_src_c_key = a131.row_key)
union
select 'ldb.dh_user_group_level1 a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16
on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level1 a132
on (a16.lev_1_key = a132.row_key)
union
select 'ldb.d_internal_organization_vendor_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_organization_vendor_c a133
on (a15.vendor_c_key = a133.row_key)
union
select 'ldb.d_business_service_criticality a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a17
on (a11.business_service_c_key = a17.row_key)
join ldb.d_business_service_criticality a134
on (a17.criticality_key = a134.row_key)
union
select 'ldb.d_internal_contact_service_owned_by_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a17
on (a11.business_service_c_key = a17.row_key)
join ldb.d_internal_contact_service_owned_by_c a135
on (a17.owned_by_c_key = a135.row_key)
union
select 'ldb.d_business_service_used_for a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a17
on (a11.business_service_c_key = a17.row_key)
join ldb.d_business_service_used_for a136
on (a17.used_for_src_key = a136.row_key)
union
select 'ldb.d_calendar_week a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_week a137
on (a18.week_start_date_key = a137.row_key)
union
select 'ldb.d_lov_change_request_closure_code_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_lov_change_request_closure_code_c a138
on (a13.closure_code_src_c_key = a138.row_key)
union
select 'ldb.d_change_request_cmdb_location_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
join ldb.d_change_request_cmdb_location_c a139
on (a110.cmdb_location_c_key = a139.row_key)
union
select 'ldb.d_lov_change_request_database_type_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_lov_change_request_database_type_c a140
on (a13.database_type_src_c_key = a140.row_key)
union
select 'ldb.dh_user_group_level2 a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16
on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level2 a141
on (a16.lev_2_key = a141.row_key)
union
select 'ldb.d_calendar_month a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_month a142
on (a18.month_start_date_key = a142.row_key)
union
select 'ldb.d_calendar_quarter a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_quarter a143
on (a18.quarter_start_date_key = a143.row_key)
union
select 'ldb.d_calendar_year a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_year a144
on (a18.year_start_date_key = a144.row_key)
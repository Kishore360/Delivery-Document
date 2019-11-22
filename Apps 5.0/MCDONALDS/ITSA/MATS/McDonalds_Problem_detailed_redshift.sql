--Need to exclude these assingment groups -- 

 'XRX/BRIDGE','MCD/SUPPLY CHAIN MASTER DATA L4 SUPPORT','MCD/GROIP L3 CA','MCD/RS RFM GCOE','Middleware L3 Mulesoft','CS/SD/RTPAAS/SCCM/L3/MCD','MCD/RS L3 RIDM US',
'CS/OE/SERVER ADMIN/MCD','MCD/GDW GBL SUPPORT','MCD/RS CM US RFM','MCD/CA OurLounge Support T2','MCD/GDW ITEM MASTER SUPPORT','ACCO/ACS/3RD LEVEL ORACLE/SQL DATABASE S','NewPOS Team',
'CS/SD/PORTAL ENGINEERING/MCD','CS/GSD/SE/OSE/LINUX/MCDONALDS','MCD/GENESIS','McWeb Support CA','MBS SUPPORT - IT CORE','MCD/EAI L2 ES','MCD/EAI L2 DE','AccessMcD Support',
'MCD/GROIP L2 CA','MCD/GDW INFRASTRUCTURE DBA-L2','MCD/TWK-BUSINESS','MCD/RS L1 RIDM US','Field Services','Service Café Enhancement','RS IT Delivery RTPaaS EU APMEA','MCD/RS L4 VERIFONE',
'MCD/MERLIN L4 ORACLE','MCD/ITF GLOBAL ACCOUNT PORTAL SUPPORT','MCD/TLD-SUPPORT','CS/OE/USERACCESS/APPCAT/MCD','MTM Data Support','MCD/RS L4 RIDM','Service Desk Level 1',
'MCD/RS RFM2 DEPLOYMENT','MCD/MERLIN L2 AR','MCD/GLMS L3 TECHNICAL','MCD/RS RTPAAS CHANGE MGMT','MCD/RS L3 LATAM RDI','MCD/GLOBAL HRMS TECH SUPPORT','MCD/RS L3 AP FAST',
'MCD/DATAPIPE','CS/OE/USERACCESS/SIMSYSTEMADMIN/MCD','EASS /DSS Cassandra DBA Support','Back Office','Virtual Provisioning Cloud Administrators','MCD/CANADA','XRX/ITSD - L1',
'MCD/COMPASS','MCD/RS L3 EU TECH SERVICES','MCD/US IT SECURITY','RTPaaS RSM L3 Support','MicroServices Support','MCD/X-APPS','MCD/CA Restaurant Application Development L3','Datavail Corp DB Admin','CA Migration',
'ECP ID','MCD/GBS-People',



select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a12
on (a11.opened_by_key = a12.row_key)
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a13
on (a11.opened_time_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.dh_user_group_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
join ldb.dh_user_group_hierarchy a16
on (a15.row_dn_key = a16.lev_0_key)
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a19
on (a11.configuration_item_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_month a110
on (a18.month_start_date_key = a110.row_key)
union
select 'ldb.d_problem a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
union
select 'ldb.d_businessunit_custom_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_businessunit_custom_c a112
on (a11.businessunit_custom_c_key = a112.row_key)
union
select 'ldb.d_change_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_change_request a113
on (a11.change_request_key = a113.row_key)
union
select 'ldb.d_internal_organization_department a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_organization_department a114
on (a12.department_key = a114.row_key)
union
select 'ldb.d_internal_contact_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm a115
on (a12.row_current_key = a115.row_current_key)
union
select 'ldb.d_calendar_time_hour a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a13
on (a11.opened_time_key = a13.row_key)
join ldb.d_calendar_time_hour a116
on (a13.hour_24_format_num = a116.hour_24_format_num)
union
select 'ldb.d_problem_category_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_category_c a117
on (a11.category_c_key = a117.row_key)
union
select 'ldb.d_problem_reported_type a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_reported_type a118
on (a11.reported_type_src_key = a118.row_key)
union
select 'ldb.d_problem_impact a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_impact a119
on (a11.impact_src_key = a119.row_key)
union
select 'ldb.d_internal_contact_problem_manager_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_problem_manager_c a120
on (a11.problem_manager_c_key = a120.row_key)
union
select 'ldb.d_problem_priority a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_priority a121
on (a11.priority_src_key = a121.row_key)
union
select 'ldb.d_problem_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_urgency a122
on (a11.urgency_src_key = a122.row_key)
union
select 'ldb.d_scafe_core_realm_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_scafe_core_realm_c a123
on (a11.scafe_core_realm_c_key = a123.row_key)
union
select 'ldb.d_location a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_location a124
on (a11.location_key = a124.row_key)
union
select 'ldb.d_location_assigned_to a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
join ldb.d_location_assigned_to a125
on (a14.location_key = a125.row_key)
union
select 'ldb.dh_user_group_level1 a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16
on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level1 a126
on (a16.lev_1_key = a126.row_key)
union
select 'ldb.d_business_service_criticality a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_criticality a127
on (a17.criticality_key = a127.row_key)
union
select 'ldb.d_internal_contact_service_owned_by_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_internal_contact_service_owned_by_c a128
on (a17.owned_by_c_key = a128.row_key)
union
select 'ldb.d_business_service_used_for a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_used_for a129
on (a17.used_for_src_key = a129.row_key)
union
select 'ldb.d_calendar_week a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_week a130
on (a18.week_start_date_key = a130.row_key)
union
select 'ldb.d_problem_state a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_problem_state a131
on (a111.state_src_key = a131.row_key)
union
select 'ldb.d_lov_problem_rca_status_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_lov_problem_rca_status_c a132
on (a111.rca_status_src_c_key = a132.row_key)
union
select 'ldb.d_lov_problem_service_category_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_lov_problem_service_category_c a133
on (a111.service_catagory_src_c_key = a133.row_key)
union
select 'ldb.d_lov_problem_sub_category_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_lov_problem_sub_category_c a134
on (a111.subcategory_src_c_key = a134.row_key)
union
select 'ldb.dh_user_group_level2 a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16
on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level2 a135
on (a16.lev_2_key = a135.row_key)
union
select 'ldb.dh_user_group_level3 a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16
on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level3 a136
on (a16.lev_3_key = a136.row_key)
union
select 'ldb.d_calendar_quarter a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_quarter a137
on (a18.quarter_start_date_key = a137.row_key)
union
select 'ldb.dh_user_group_level4 a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16
on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level4 a138
on (a16.lev_4_key = a138.row_key)
union
select 'ldb.d_calendar_year a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_year a139
on (a18.year_start_date_key = a139.row_key)
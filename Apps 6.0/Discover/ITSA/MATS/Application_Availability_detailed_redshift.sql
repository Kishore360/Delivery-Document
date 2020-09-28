select 'ldb.f_application_availability_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
union
select 'ldb.d_business_service a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
union
select 'ldb.d_outage a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_outage a13
on (a11.outage_key = a13.row_key)
union
select 'ldb.d_problem a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_problem a14
on (a11.problem_key = a14.row_key)
union
select 'ldb.d_incident_alert_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_problem a14
on (a11.problem_key = a14.row_key)
join ldb.d_incident_alert_c a15
on (a14.incident_alert_c_key = a15.row_key)
union
select 'ldb.d_business_service_app_support_gp_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
join ldb.d_business_service_app_support_gp_c a16
on (a12.business_service_app_support_gp_c_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_calendar_date a17
on (a11.dt_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_calendar_date a17
on (a11.dt_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_calendar_date a17
on (a11.dt_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_outage_problem_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_outage a13
on (a11.outage_key = a13.row_key)
join ldb.d_outage_problem_c a110
on (a13.outage_problem_c_key = a110.row_key)
union
select 'ldb.d_calendar_week a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_calendar_date a17
on (a11.dt_key = a17.row_key)
join ldb.d_calendar_week a111
on (a17.week_start_date_key = a111.row_key)
union
select 'ldb.d_calendar_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_calendar_date a17
on (a11.dt_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a112
on (a19.year_start_date_key = a112.row_key)
union
select 'ldb.d_problem_outage_enterprise_incident_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_outage a13
on (a11.outage_key = a13.row_key) join ldb.d_outage_problem_c a110
on (a13.outage_problem_c_key = a110.row_key)
join ldb.d_problem_outage_enterprise_incident_c a113
on (a110.problem_enterprise_incident_c = a113.row_key)
union
select 'ldb.d_outage_category_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_outage a13
on (a11.outage_key = a13.row_key)
join ldb.d_outage_category_c a114
on (a13.outage_category_src_c_key = a114.row_key)
union
select 'ldb.d_outage_location_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_outage a13
on (a11.outage_key = a13.row_key)
join ldb.d_outage_location_c a115
on (a13.outage_location_c = a115.row_key)
union
select 'ldb.d_outage_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_outage a13
on (a11.outage_key = a13.row_key)
join ldb.d_outage_type a116
on (a13.outage_type_src_key = a116.row_key)
union
select 'ldb.d_business_service_application_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
join ldb.d_business_service_application_c a117
on (a12.business_service_application_c_key = a117.row_key)
union
select 'ldb.d_business_service_business_channel_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
join ldb.d_business_service_business_channel_c a118
on (a12.service_business_channel_src_c = a118.row_key)
union
select 'ldb.d_business_service_criticality a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
join ldb.d_business_service_criticality a119
on (a12.criticality_key = a119.row_key)
union
select 'ldb.d_business_service_location_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
join ldb.d_business_service_location_c a120
on (a12.business_service_location_c_key = a120.row_key)
union
select 'ldb.d_internal_contact_business_service_managed_by_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
join ldb.d_internal_contact_business_service_managed_by_c a121
on (a12.business_service_managed_by_c_key = a121.row_key)
union
select 'ldb.d_lov_business_service_operational_status a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
join ldb.d_lov_business_service_operational_status a122
on (a12.operational_status_c_key = a122.row_key)
union
select 'ldb.d_internal_contact_business_service_owned_by_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
join ldb.d_internal_contact_business_service_owned_by_c a123
on (a12.business_service_owned_by_c_key = a123.row_key)
union
select 'ldb.d_lov_business_service_install_status a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
join ldb.d_lov_business_service_install_status a124
on (a12.install_status_c_key = a124.row_key)
union
select 'ldb.d_problem_assigned_to_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_outage a13
on (a11.outage_key = a13.row_key) join ldb.d_outage_problem_c a110
on (a13.outage_problem_c_key = a110.row_key)
join ldb.d_problem_assigned_to_c a125
on (a110.assigned_to = a125.row_key)
union
select 'ldb.d_problem_outage_responsible_group_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_outage a13
on (a11.outage_key = a13.row_key) join ldb.d_outage_problem_c a110
on (a13.outage_problem_c_key = a110.row_key)
join ldb.d_problem_outage_responsible_group_c a126
on (a110.problem_responsible_group_c = a126.row_key)
union
select 'ldb.d_lov_problem_priority_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_outage a13
on (a11.outage_key = a13.row_key) join ldb.d_outage_problem_c a110
on (a13.outage_problem_c_key = a110.row_key)
join ldb.d_lov_problem_priority_c a127
on (a110.priority_src_key = a127.row_key)
union
select 'ldb.d_lov_problem_state_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11
join ldb.d_outage a13
on (a11.outage_key = a13.row_key) join ldb.d_outage_problem_c a110
on (a13.outage_problem_c_key = a110.row_key)
join ldb.d_lov_problem_state_c a128
on (a110.problem_state_src_c_key = a128.row_key)
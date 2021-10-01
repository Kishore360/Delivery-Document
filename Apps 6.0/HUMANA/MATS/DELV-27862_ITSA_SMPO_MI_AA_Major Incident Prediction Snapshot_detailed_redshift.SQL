
/* Tables Accessed:
d_business_service
d_business_service_owned_by_c
d_business_service_owned_by_department_c
d_calendar_date
d_calendar_date_current_date_c
d_ci_criticality
d_ci_department
d_ci_location
d_ci_managed_by
d_ci_owned_by
d_ci_support_group
d_ci_supported_by
d_configuration_item
d_configuration_item_mdm
d_major_incident_risk_prediction
f_n_major_incident */

select 'ldb.f_n_major_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
union
select 'ldb.d_configuration_item_mdm a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a14
on (a12.mdm_key = a14.row_key)
union
select 'ldb.d_calendar_date_current_date_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_calendar_date_current_date_c a15
on (a11.current_date_key = a15.row_key)
union
select 'ldb.d_major_incident_risk_prediction a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_major_incident_risk_prediction a16
on (a11.major_incident_risk_prediction_key = a16.row_key)
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_business_service a17
on (a11.business_service_c_key = a17.row_key)
union
select 'ldb.d_ci_criticality a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_criticality a18
on (a12.criticality_key = a18.row_key)
union
select 'ldb.d_ci_department a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_department a19
on (a12.department_key = a19.row_key)
union
select 'ldb.d_ci_location a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_location a110
on (a12.location_key = a110.row_key)
union
select 'ldb.d_ci_managed_by a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_managed_by a111
on (a12.managed_by_key = a111.row_key)
union
select 'ldb.d_ci_owned_by a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_owned_by a112
on (a12.owned_by_key = a112.row_key)
union
select 'ldb.d_ci_support_group a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_support_group a113
on (a12.support_group_key = a113.row_key)
union
select 'ldb.d_ci_supported_by a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_supported_by a114
on (a12.supported_by_key = a114.row_key)
UNION 
select 'ldb.d_business_service_owned_by_c a18' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_business_service a17 on (a11.business_service_c_key = a17.row_key)
join ldb.d_business_service_owned_by_c a18 ON (a17.business_service_owned_by_c_key=a18.row_key)
UNION 
select 'ldb.d_business_service_owned_by_department_c a18' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_major_incident a11
join ldb.d_business_service a17 on (a11.business_service_c_key = a17.row_key)
join ldb.d_business_service_owned_by_c a18 ON (a17.business_service_owned_by_c_key=a18.row_key)
join ldb.d_business_service_owned_by_department_c a19 ON (a18.department_key=a19.row_key)
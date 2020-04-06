select 'ldb.f_incident_credit_score_detail a11 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_configuration_item_mdm a15 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a15
on (a13.mdm_key = a15.row_key)
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
union
select 'ldb.d_application_mdm a17 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a17
on (a12.mdm_key = a17.row_key)
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_internal_contact_assigned_to a18
on (a11.assigned_to_key = a18.row_key)
union
select 'ldb.d_business_service a19 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
union
select 'ldb.d_internal_organization_department a110 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_internal_organization_department a110
on (a11.department_key = a110.row_key)
union
select 'ldb.d_assignment_group_leader a111 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
join ldb.d_assignment_group_leader a111
on (a14.assignment_group_leader_key = a111.row_key)
union
select 'ldb.d_incident_priority a112 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_priority a112
on (a16.priority_src_key = a112.row_key)
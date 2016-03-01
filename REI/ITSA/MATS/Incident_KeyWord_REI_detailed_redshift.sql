select 'f_incident_response'as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword	a11
union

select  'd_internal_organization_legalentity' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_internal_organization_legalentity	a12
   on         (a11.company_key = a12.row_key)

union

select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_internal_contact	a13
   on         (a11.opened_by_key = a13.row_key)


union

select  'd_calendar_time' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_calendar_time	a14
   on         (a11.opened_time_key = a14.row_key)

union

select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_calendar_date	a15
   on         (a11.opened_on_key = a15.row_key)


union

select  'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
  join        ldb.d_calendar_date	a15
   on         (a11.opened_on_key = a15.row_key)
   join        ldb.d_calendar_month a16
   on         (a15.month_start_date_key = a16.row_key)


union

select  'd_incident' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_incident	a17
   on         (a11.incident_key = a17.row_key)


union

select  'd_incident_state' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_incident_state	a18
   on         (a11.state_src_key = a18.row_key)

union

select  'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_internal_organization_department	a19
   on         (a11.opened_by_department_key = a19.row_key)


union

select  'd_internal_organization_group' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_internal_organization_group	a20
   on         (a11.assignment_group_key = a20.row_key)



union

select  'd_customer' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_customer	a21
   on         (a11.customer_key = a21.row_key)


union

select  'dh_assignment_group_tier_hierarchy' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
join        ldb.d_internal_organization_group	a20
   on         (a11.assignment_group_key = a20.row_key)
   join        ldb.dh_assignment_group_tier_hierarchy	a22
   on         (a22.user_group_tier_key= a20.row_key)


union

select  'd_configuration_item ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_customer	a24
   on         (a11.configuration_item_key = a24.row_key)

union

select  'd_employee_location' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
join	ldb.d_internal_contact	a16
	  on 	(a11.opened_by_key = a16.row_key)
join	ldb.d_internal_contact_mdm	a113
	  on 	(a16.row_current_key = a113.row_current_key)
   join        ldb.d_employee_location	a25
   on         (a113.location_key = a25.row_key)


union

select  'd_location' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_location	a26
   on         (a11.location_key = a26.row_key)


union

select  'd_domain' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_domain	a27
   on         (a11.domain_key = a27.row_key)


union

select  'd_incident_category' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_incident_category	a28
   on         (a11.category_src_key = a28.row_key)



union

select  'd_incident_close_code' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_incident_close_code	a29
   on         (a11.close_code_src_key = a29.row_key)



union

select  'd_incident_severity' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_incident_severity	a30
   on         (a11.severity_src_key = a30.row_key)





union

select  'd_incident_subcategory' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_incident_subcategory	a31
   on         (a11.sub_category_src_key = a31.row_key)



union

select  'd_task_impact' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_task_impact	a32
   on         (a11.impact_src_key = a32.row_key)



union

select  'd_task_priority' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_task_priority	a33
   on         (a11.priority_src_key = a33.row_key)


union

select  'd_task_contacttype' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_task_contacttype	a34
   on         (a11.reported_type_src_key = a34.row_key)


union

select  'd_task_contacttype' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_keyword    a11
   join        ldb.d_task_urgency	a35
   on         (a11.urgency_src_key = a35.row_key)
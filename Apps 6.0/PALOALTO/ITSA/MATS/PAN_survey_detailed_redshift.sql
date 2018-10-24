select 'ldb.f_incident_response a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact a12 
on (a11.sent_to_key = a12.row_key) 
union
select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.requested_on_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a14 
on (a11.requested_on_key = a14.row_key) 
union
select 'ldb.d_incident a15 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_incident a15 
on (a11.incident_key = a15.row_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a14 
on (a11.requested_on_key = a14.row_key) 
join ldb.d_calendar_month a16 
on (a14.month_start_date_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_survey_question a18 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_question a18 
on (a11.question_key = a18.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact_assigned_to a19 
on (a11.assigned_to_key = a19.row_key) 
union
select 'ldb.d_internal_organization_department a110 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_department a110 
on (a11.taken_by_department_key = a110.row_key) 
union
select 'ldb.d_internal_contact_mdm a111 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_contact a12 
on (a11.sent_to_key = a12.row_key) 
join ldb.d_internal_contact_mdm a111 
on (a12.row_current_key = a111.row_current_key) 
union
select 'ldb.d_calendar_fiscal_quarter a112 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.requested_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_quarter a112 
on (a13.quarter_start_date_key = a112.row_key) 
union
select 'ldb.d_location a113 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_location a113 
on (a11.location_key = a113.row_key) 
union
select 'ldb.d_survey a114 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey a114 
on (a11.survey_key = a114.row_key) 
union
select 'ldb.d_survey_instance a115 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_instance a115 
on (a11.survey_instance_key = a115.row_key) 
union
select 'ldb.d_survey_state a116 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_state a116 
on (a11.survey_state_src_key = a116.row_key) 
union
select 'ldb.d_calendar_week a117 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a14 
on (a11.requested_on_key = a14.row_key) 
join ldb.d_calendar_week a117 
on (a14.week_start_date_key = a117.row_key) 
union
select 'ldb.d_calendar_fiscal_year a118 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.requested_on_key = a13.row_key) 
join ldb.d_calendar_fiscal_year a118 
on (a13.year_start_date_key = a118.row_key) 
union
/*select 'ldb.d_internal_organization_group_parent_c a119 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
	join	ldb.d_internal_organization_group_parent_internal_c	a113
	  on 	(a11.assignment_group_c_key = a113.row_key)
join ldb.d_internal_organization_group_parent_c a119 
on (a113.parent_row_c_key = a119.row_key)	
union*/
select 'ldb.d_question_type a120 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_survey_question a18 
on (a11.question_key = a18.row_key) 
join ldb.d_question_type a120 
on (a18.question_type_src_key = a120.row_key) 
union
select 'ldb.d_calendar_quarter a121 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a14 
on (a11.requested_on_key = a14.row_key) 
 join ldb.d_calendar_month a17 
on (a14.month_start_date_key = a17.row_key)  
union
select 'ldb.d_calendar_year a122 ' as Table_name, count(1) Row_Count
from ldb.f_incident_response a11 
join ldb.d_calendar_date a14 
on (a11.requested_on_key = a14.row_key)
join ldb.d_calendar_month a19 
on (a14.month_start_date_key = a19.row_key)
join ldb.d_calendar_quarter a18 
on (a19.quarter_start_date_key = a18.row_key) 

join ldb.d_calendar_year a122 
on (a18.year_start_date_key = a122.row_key) 
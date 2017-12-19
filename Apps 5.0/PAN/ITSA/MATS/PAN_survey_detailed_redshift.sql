select 'ldb.f_incident_response a11 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
union	
select 'ldb.d_calendar_date_fiscal a11 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 			
 join          ldb.d_calendar_date_fiscal    a13
                  on          (a11.requested_on_key = a13.row_key)
				  
				  union
				  select 'ldb.d_calendar_fiscal_quarter a11 ' as Table_name, count(a11.row_key) Row_Count					
from ldb.f_incident_response a11 			
 join          ldb.d_calendar_date_fiscal    a13
                  on          (a11.requested_on_key = a13.row_key)
				  join          ldb.d_calendar_fiscal_quarter               a16
                  on          (a13.Quarter_Fiscal_Row_Key = a16.row_key)
				   union
				  select 'ldb.d_calendar_fiscal_year a11 ' as Table_name, count(a11.row_key) Row_Count					
from ldb.f_incident_response a11 			
 join          ldb.d_calendar_date_fiscal    a13
                  on          (a11.requested_on_key = a13.row_key)
				  join          ldb.d_calendar_fiscal_year               a16
                  on          (a13.year_Fiscal_Row_Key = a16.row_key)
union						
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
join ldb.d_internal_contact a12 										
on (a11.sent_to_key = a12.row_key) 										
union										
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
join ldb.d_calendar_date a13 										
on (a11.requested_on_key = a13.row_key) 										
union										
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
join ldb.d_internal_organization_group a14 										
on (a11.assignment_group_key = a14.row_key) 										
union										
select 'ldb.d_survey_question a15 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
join ldb.d_survey_question a15 										
on (a11.question_key = a15.row_key) 										
union										
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
left outer join ldb.d_internal_contact_assigned_to a16 										
on (a11.assigned_to_key = a16.row_key) 										
union										
select 'ldb.d_internal_organization_department a17 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
left outer join ldb.d_internal_organization_department a17 										
on (a11.taken_by_department_key = a17.row_key) 										
union										
select 'ldb.d_internal_contact_mdm a18 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
join ldb.d_internal_contact a12 										
on (a11.sent_to_key = a12.row_key) 										
left outer join ldb.d_internal_contact_mdm a18 										
on (a12.row_current_key = a18.row_current_key) 										
union										
select 'ldb.d_incident a19 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
left outer join ldb.d_incident a19 										
on (a11.incident_key = a19.row_key) 										
union										
select 'ldb.d_location a110 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
left outer join ldb.d_location a110 										
on (a11.location_key = a110.row_key) 										
union										
select 'ldb.d_survey a111 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
left outer join ldb.d_survey a111 										
on (a11.survey_key = a111.row_key) 										
union										
select 'ldb.d_survey_instance a112 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
left outer join ldb.d_survey_instance a112 										
on (a11.survey_instance_key = a112.row_key) 										
union										
select 'ldb.d_survey_state a113 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
left outer join ldb.d_survey_state a113 										
on (a11.survey_state_src_key = a113.row_key) 										
union										
select 'ldb.d_calendar_month a114 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
join ldb.d_calendar_date a13 										
on (a11.requested_on_key = a13.row_key) 										
left outer join ldb.d_calendar_month a114 										
on (a13.month_start_date_key = a114.row_key) 										
union										
select 'ldb.d_internal_organization_group_parent_c a115 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
join ldb.d_internal_organization_group a14 										
on (a11.assignment_group_key = a14.row_key) 										
left outer join ldb.d_internal_organization_group_parent_c a115 										
on (a14.parent_row_key_c = a115.row_key) 										
union										
select 'ldb.d_question_type a116 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
join ldb.d_survey_question a15 										
on (a11.question_key = a15.row_key) 										
left outer join ldb.d_question_type a116 										
on (a15.question_type_src_key = a116.row_key) 										
union										
select 'ldb.d_calendar_week a117 ' as Table_name, count(a11.row_key) Row_Count										
from ldb.f_incident_response a11 										
join ldb.d_calendar_date a13 										
on (a11.requested_on_key = a13.row_key) 										
left outer join ldb.d_calendar_week a117 										
on (a13.week_start_date_key = a117.row_key) 										

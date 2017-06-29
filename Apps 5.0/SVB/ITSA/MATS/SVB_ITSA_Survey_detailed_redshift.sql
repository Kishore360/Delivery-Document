select 'ldb.f_incident_response' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_calendar_date a13
on          (a11.requested_on_key = a13.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11
 join ldb.d_calendar_date a13
on          (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_month a14
on          (a13.month_start_date_key = a14.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11
 join ldb.d_calendar_date a13
on          (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_quarter a14
on          (a13.quarter_start_date_key = a14.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11
 join ldb.d_calendar_date a13
on          (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_week a14
on          (a13.week_start_date_key = a14.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11
 join ldb.d_calendar_date a13
on          (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_year a14
on          (a13.year_start_date_key = a14.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_configuration_item a13
on          (a11.configuration_item_key = a13.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_incident a13
on          (a11.incident_key = a13.row_key)
union
select'ldb.d_incident_opened_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_incident a13
on          (a11.incident_key = a13.row_key)
join ldb.d_incident_opened_by a14
on          (a13.opened_by_key = a14.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_incident a13
on          (a11.incident_key = a13.row_key)
join ldb.d_incident_priority a14
on          (a13.priority_src_key = a14.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_internal_contact a14
on          (a11.sent_to_key = a14.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_internal_contact a13
on          (a11.sent_to_key = a13.row_key)
join ldb.d_internal_contact_mdm a14
on          (a13.row_current_key = a14.row_current_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_internal_contact_assigned_to a14
on          (a11.assigned_to_key = a14.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_internal_organization_department a13
on          (a11.taken_by_department_key = a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_internal_organization_group a13
on          (a11.assignment_group_key = a13.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_location a13
on          (a11.location_key = a13.row_key)
union
select'ldb.d_survey_question' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_survey_question a13
on          (a11.question_key = a13.row_key)
union
select'ldb.d_question_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_survey_question a13
on          (a11.question_key = a13.row_key)
join ldb.d_question_type a14
on          (a13.question_type_src_key = a14.row_key)
union
select'ldb.d_survey' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_survey a13
on          (a11.survey_key = a13.row_key)
union
select'ldb.d_survey_instance' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_survey_instance a13
on          (a11.survey_instance_key = a13.row_key)
union
select'ldb.d_survey_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_survey_state a13
on          (a11.survey_state_src_key = a13.row_key)
select'ldb.f_incident_response' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
join ldb.d_calendar_date       a12
on (a11.requested_on_key=a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_calendar_date       a12
on (a11.requested_on_key=a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key=a13.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_calendar_date       a12
on (a11.requested_on_key=a12.row_key)
join ldb.d_calendar_week       a14
on (a12.week_start_date_key=a14.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_incident       a15
on (a11.incident_key=a15.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_internal_contact       a16
on (a11.sent_to_key=a16.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_internal_contact_assigned_to       a17
on (a11.assigned_to_key=a17.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
  join ldb.d_internal_contact       a16
on (a11.sent_to_key=a16.row_key)
 join ldb.d_internal_contact_mdm       a18
on (a16.row_current_key=a18.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_internal_organization_department       a19
on (a11.taken_by_department_key=a19.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_internal_organization_department       a20
on (a11.taken_by_department_key=a20.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_internal_organization_group       a21
on (a11.assignment_group_key=a21.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_location       a21
on (a11.location_key=a21.row_key)
union
select'ldb.d_survey_question' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_survey_question       a22
on (a11.survey_key=a22.row_key)
union
select'ldb.d_question_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_survey_question       a21
on (a11.question_key=a21.row_key)
 join ldb.d_question_type       a23
on (a21.question_type_src_key=a23.row_key)
union
select'ldb.d_survey' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_survey       a24
on (a11.survey_key=a24.row_key)
union
select'ldb.d_survey_instance' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_survey_instance       a25
on (a11.survey_instance_key=a25.row_key)
union
select'ldb.d_survey_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response       a11 
 join ldb.d_survey_state       a26
on (a11.survey_state_src_key=a26.row_key)

select'f_incident_response' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
 union
 select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_calendar_date         a12
on (a11.requested_on_key = a12.row_key)
 union
 select'd_calendar_date 1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_calendar_date         a12
on (a11.completed_on_key = a12.row_key)
union
 select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_calendar_date         a12
on (a11.requested_on_key = a12.row_key)
join ldb.d_calendar_month        a13
on (a12.month_start_date_key = a13.row_key)
union
select'd_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
left join ldb.d_incident         a14
on (a11.incident_key = a14.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
left outer join ldb.d_internal_contact         a15
on (a11.assigned_to_key = a15.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
left outer join ldb.d_internal_contact         a15
on (a11.opened_by_key = a15.row_key)
left outer join ldb.d_internal_contact_mdm         a16
on (a15.row_current_key = a16.row_current_key)
union
select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
left outer join ldb.d_internal_organization_department         a17
on (a11.taken_by_department_key = a17.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
left outer join ldb.d_internal_organization_group         a18
on (a11.assignment_group_key = a18.row_key)
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
left outer join ldb.d_location         a19
on (a11.location_key = a19.row_key)
union
select'd_survey_question' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_survey_question         a110
on (a11.question_key = a110.row_key)
union
select'd_question_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
  join ldb.d_survey_question         a110
on (a11.question_key = a110.row_key)
left outer join ldb.d_question_type         a111
on (a110.question_type_src_key = a111.row_key)
union
select'd_survey' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
left outer join ldb.d_survey         a112
on (a11.survey_key = a112.row_key)
union
select'd_survey_instance' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_survey_instance         a112
on (a11.survey_instance_key = a112.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_internal_contact         a113
on (a11.sent_to_key = a113.row_key)

 select'd_internal_contact_investigator_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_internal_contact_investigator_c         a21
on (a11.investigator_c_key = a21.row_key)
 union
 select'd_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_location         a22
on (a11.location_key = a22.row_key)
 union
 select'd_survey' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_survey         a23
on (a11.survey_key = a23.row_key)
 union
 select'd_survey_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_survey_state         a24
on (a11.survey_state_src_key = a24.row_key)
 union
 select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
 join ldb.d_calendar_date         a13
on (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_month         a25
on (a13.month_start_date_key = a25.row_key)
 union
  select'd_question_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
 join ldb.d_survey_question a12
 on a11.question_key=a12.row_key
join ldb.d_question_type         a26
on (a12.question_type_src_key = a26.row_key)
 union
 select'd_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
 join ldb.d_calendar_date         a13
on (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_week         a27
on (a13.week_start_date_key = a27.row_key)
 union
 select'd_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
 join ldb.d_calendar_date         a13
on (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_quarter         a28
on (a13.quarter_start_date_key = a28.row_key)
 union
  select'd_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
 join ldb.d_calendar_date         a13
on (a11.requested_on_key = a13.row_key)
join ldb.d_calendar_year         a29
on (a13.year_start_date_key = a29.row_key)
union
select'd_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
 join ldb.d_survey_instance         a30
on (a11.survey_instance_key = a30.row_key)

select'f_task_response_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
 union
 select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_internal_contact         a12
on (a11.sent_to_key = a12.row_key)
union
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_calendar_date         a13
on (a11.requested_on_key = a13.row_key)
 union
 select'd_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_task_ra_c         a14
on (a11.survey_task_key = a14.row_key)
 union
 select'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_internal_contact_assigned_to         a15
on (a11.assigned_to_key = a15.row_key)
 union
 select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_internal_organization_group         a16
on (a11.assignment_group_key = a16.row_key)
 union
 select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_internal_organization_department         a17
on (a11.taken_by_department_key = a17.row_key)
 union
 select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
 join ldb.d_internal_contact         a12
on (a11.sent_to_key = a12.row_key)
join ldb.d_internal_contact_mdm         a18
on (a12.row_current_key = a18.row_key)
 union
 select'd_survey_closure_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_survey_closure_code_c         a19
on (a11.closure_code_src_c_key = a19.row_key)
 union
  select'd_survey_investigation_complete_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c             a11 
join ldb.d_survey_investigation_complete_c         a20
on (a11.investigation_complete_src_c_key = a20.row_key)
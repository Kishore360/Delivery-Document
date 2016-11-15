select 'ldb.f_task_response_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
 union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_internal_contact       a12
on (a11.sent_to_key=a12.row_key)
union
select'ldb.d_survey_instance' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_survey_instance       a13
on (a11.survey_instance_key=a13.row_key)
union
select'ldb.d_survey_question' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_survey_question       a14
on (a11.question_key=a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key=a15.row_key)
union
select'ldb.d_internal_contact_emp_seniors_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
 join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key=a15.row_key)
join ldb.d_internal_contact_emp_seniors_c       a16
on (a15.manager_c_key=a16.row_key)
union
select'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_assignment_group_level0_manager_c_relation       a17
on (a11.assignment_group_key=a17.level0_assigment_group_key)
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_calendar_greg_fiscal_c       a18
on (a11.requested_on_key=a18.greogrian_calendar_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11
 join ldb.d_calendar_greg_fiscal_c       a18
on (a11.requested_on_key=a18.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a19
on (a18.fiscal_key=a19.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_calendar_date       a110
on (a11.requested_on_key=a110.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_internal_contact_assigned_to       a111
on (a11.assigned_to_key=a111.row_key)
union
select'ldb.d_task_survey_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_task_survey_c       a115
on (a11.task_c_key=a115.row_key)
union
select'ldb.d_lov_calculation_type_response_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_lov_calculation_type_response_c       a116
on (a11.calculation_type_c_key=a116.row_key)
union
select'ldb.d_calendar_date_completed_on_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_calendar_date_completed_on_c       a117
on (a11.completed_on_key=a117.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_configuration_item       a118
on (a11.configuration_item_key=a118.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_internal_organization_department       a119
on (a11.opened_by_department_key=a119.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
 join ldb.d_internal_contact       a12
on (a11.sent_to_key=a12.row_key)
join ldb.d_internal_contact_mdm       a120
on (a12.row_current_key=a120.row_current_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_master_item       a121
on (a11.catalog_item_key=a121.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_location       a122
on (a11.location_key=a122.row_key)
union
select'ldb.d_internal_contact_location_site_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_internal_contact_location_site_c       a123
on (a11.opened_on_behalf_of_c_key=a123.row_key)
union
select'ldb.d_survey' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_survey       a124
on (a11.survey_key=a124.row_key)
union
select'ldb.d_survey_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_survey_state       a125
on (a11.survey_state_src_key=a125.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
join ldb.d_task_contacttype       a126
on (a11.reported_type_src_key=a126.row_key)
union
select'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
 join ldb.d_assignment_group_level0_manager_c_relation       a17
on (a11.assignment_group_key=a17.level0_assigment_group_key)
join ldb.d_assignment_group_level0_manager_c       a127
on (a17.level0_manager_c_key=a127.level0_manager_c_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11 
  join ldb.d_calendar_greg_fiscal_c       a18
on (a11.requested_on_key=a18.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a19
on (a18.fiscal_key=a19.row_key)
join ldb.d_calendar_fiscal_year       a128
on (a19.year_start_date_key=a128.row_key)
union
select'ldb.d_internal_contact_emp_seniors_assigned_to_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11
 join ldb.d_internal_contact_assigned_to       a111
on (a11.assigned_to_key=a111.row_key)
join ldb.d_internal_contact_emp_seniors_assigned_to_c       a129
on (a111.manager_c_key=a129.row_key)
union
select'ldb.d_question_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_response_c       a11
join ldb.d_survey_question       a14
on (a11.question_key=a14.row_key)
join ldb.d_question_type       a130
on (a14.question_type_src_key=a130.row_key)





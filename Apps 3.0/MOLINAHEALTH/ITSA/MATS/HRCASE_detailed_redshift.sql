 select'f_hr_case_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_case_c             a11 
 union
 select'd_internal_contact_opened_for_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_case_c             a11 
join ldb.d_internal_contact_opened_for_c         a12
on (a11.requested_for_key = a12.row_key)
union
 select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_case_c             a11 
join ldb.d_internal_organization_department         a12
on (a11.department_key = a12.row_key)
union
 select'd_hr_case_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_case_c             a11 
join ldb.d_hr_case_category_c         a12
on (a11.category_src_key = a12.row_key)
union
 select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_case_c             a11 
join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key = a12.row_key)
union
 select'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_case_c             a11 
join ldb.d_internal_contact_assigned_to         a12
on (a11.assigned_to_key = a12.row_key)
union
 select'd_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_case_c             a11 
join ldb.d_internal_organization_legalentity         a12
on (a11.company_key = a12.row_key)
union
 select'd_hr_case_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_case_c             a11 
join ldb.d_hr_case_state_c         a12
on (a11.state_src_key = a12.row_key)
union
 select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_case_c             a11 
join ldb.d_task_priority         a12
on (a11.priority_src_key = a12.row_key)
union
 select'd_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_case_c             a11 
join ldb.d_internal_contact_opened_by_c         a12
on (a11.opened_by_key = a12.row_key)
union
 select'd_internal_contact_closed_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_case_c             a11 
join ldb.d_internal_contact_closed_by_c         a12
on (a11.closed_by_key = a12.row_key)
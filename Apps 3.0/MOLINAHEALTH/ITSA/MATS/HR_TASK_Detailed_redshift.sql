select'f_hr_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
 union
 select'd_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
join ldb.d_internal_organization_legalentity         a12
on (a11.company_key = a12.row_key)
 union
 select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key = a12.row_key)
union
 select'd_hr_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
join ldb.d_hr_task_c         a12
on (a11.hr_task_c_key = a12.row_key)
 union
 select'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
join ldb.d_internal_contact_assigned_to         a12
on (a11.assigned_to_key = a12.row_key)
union
 select'd_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
join ldb.d_internal_contact_task_closed_by         a12
on (a11.closed_by_key = a12.row_key)
union
 select'd_hr_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
join ldb.d_hr_case_c         a12
on (a11.hr_case_c_key = a12.row_key)
 union
 select'd_hr_task_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
join ldb.d_hr_task_state_c         a12
on (a11.state_src_key = a12.row_key)
UNION
select'd_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
join ldb.d_internal_contact_opened_by_c         a12
on (a11.opened_by_key = a12.row_key)
 union
 select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
join ldb.d_task_priority         a12
on (a11.priority_src_key = a12.row_key)
union
 select'd_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
   join          ldb.d_internal_organization_group        a13
                  on          (a11.assignment_group_key = a13.row_key)
join ldb.d_internal_contact_manager_c         a12
on (a13.manager_c_key = a12.row_key)
 union
 select'd_internal_organization_gp_depart_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_hr_task_c             a11 
   join          ldb.d_internal_organization_group        a13
                  on          (a11.assignment_group_key = a13.row_key)
join ldb.d_internal_organization_gp_depart_c         a12
on (a13.department_c_key = a12.row_key)	
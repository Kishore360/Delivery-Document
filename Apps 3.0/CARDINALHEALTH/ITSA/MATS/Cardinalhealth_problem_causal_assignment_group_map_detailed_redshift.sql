select'ldb.f_problem_causal_assignment_group_map_c' as Table_Name, count(a11.problem_key) Row_Count
 from  ldb.f_problem_causal_assignment_group_map_c       a11 
union
select'ldb.d_internal_organization_causal_assignment_group2_c' as Table_Name, count(a11.problem_key) Row_Count
 from  ldb.f_problem_causal_assignment_group_map_c       a11 
join ldb.d_internal_organization_causal_assignment_group2_c       a12
on (a11.causal_assignment_group_key=a12.row_key)
union
select'ldb.d_internal_contact_causal_ag_c' as Table_Name, count(a11.problem_key) Row_Count
 from  ldb.f_problem_causal_assignment_group_map_c       a11 
 join ldb.d_internal_organization_causal_assignment_group2_c       a12
on (a11.causal_assignment_group_key=a12.row_key)
join ldb.d_internal_contact_causal_ag_c a13
on (a12.manager_c_key = a13.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.problem_key) Row_Count
 from  ldb.f_problem_causal_assignment_group_map_c       a11 
join ldb.d_problem       a14
on (a11.problem_key=a14.row_key)

 select'f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 union
 select'd_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
  join          ldb.d_internal_organization_group        a15
                  on          (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_manager_c         a12
on (a15.manager_c_key = a12.row_key)
union
select'd_internal_organization_gp_depart_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
  join          ldb.d_internal_organization_group        a15
                  on          (a11.assignment_group_key = a15.row_key)
      join          ldb.d_internal_organization_gp_depart_c             a124
                  on          (a15.department_c_key = a124.row_key)
				  union
select 'd_business_unit_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 				  
				    join          ldb.d_configuration_item        a19
                  on          (a11.configuration_item_key = a19.row_key)				  
				      join          ldb.d_business_unit_c           a127
                  on          (a19.business_unit_c_key = a127.row_key)
				  union
select 'd_lov_resolution_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 			  
				     join          ldb.d_problem         a110
                  on          (a11.problem_key = a110.row_key)
				   join          ldb.d_lov_resolution_category_c          a129
                  on          (a110.resolution_category_src_c_key = a129.row_key)
				  union
select 'd_lov_resolution_subcategory_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 			  
				     join          ldb.d_problem         a110
                  on          (a11.problem_key = a110.row_key)				  
join          ldb.d_lov_resolution_subcategory_c    a130
                  on          (a110.resolution_subcategory_src_c_key = a130.row_key)
union
select 'd_lov_status_code_src_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 			  
				     join          ldb.d_problem         a110
                  on          (a11.problem_key = a110.row_key)				  
				  				   join          ldb.d_lov_status_code_src_c                a131
                  on          (a110.status_code_src_c_key = a131.row_key)
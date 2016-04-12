select'f_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 union
 select'd_internal_contact_requested_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
				    join          ldb.d_internal_contact_requested_by_c               a122
                  on          (a11.requested_by_c_key = a122.row_key)
				  union
				  select'd_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
				  				      join          ldb.d_internal_organization_group        a14
                  on          (a11.assignment_group_key = a14.row_key)
				    join          ldb.d_internal_contact_manager_c       a125
                  on          (a14.manager_c_key = a125.row_key)
				  union
				  select'd_internal_organization_gp_depart_c' as Table_Name, count(a11.row_key) Row_Count
 				  from         ldb.f_change_request         a11
				      join          ldb.d_internal_organization_group        a14
                  on          (a11.assignment_group_key = a14.row_key)
				   join          ldb.d_internal_organization_gp_depart_c             a126
                  on          (a14.department_c_key = a126.row_key)
				  union
				  select'd_lov_completion_status_src_c' as Table_Name, count(a11.row_key) Row_Count
 				  from         ldb.f_change_request         a11
				   join          ldb.d_change_request            a13
                  on          (a11.change_request_key = a13.row_key)
				  join          ldb.d_lov_completion_status_src_c      a129
                  on          (a13.completion_status_src_c_key = a129.row_key)
				  
				   union
				   select'd_business_unit_c' as Table_Name, count(a11.row_key) Row_Count
 				  from         ldb.f_change_request         a11
				         join          ldb.d_configuration_item        a17
                  on          (a11.configuration_item_key = a17.row_key)
                join          ldb.d_business_unit_c           a130
                  on          (a17.business_unit_c_key = a130.row_key)
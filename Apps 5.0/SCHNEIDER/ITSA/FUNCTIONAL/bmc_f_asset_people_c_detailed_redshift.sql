
				   select'f_asset_people_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_asset_people_c             a11 
 union
 select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_asset_people_c             a11 
join ldb.d_internal_contact         a12
on         (a11.employee_key = a12.row_key)
 union
 select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_asset_people_c             a11 
join ldb.d_internal_contact         a12
on         (a11.employee_key = a12.row_key)
   join        ldb.d_internal_contact_mdm     a14
                  on         (a12.row_current_key = a14.row_current_key)
				   union
 select'd_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_asset_people_c             a11 
join ldb.d_internal_contact         a12
on         (a11.employee_key = a12.row_key)
  join        ldb.d_internal_contact_mdm     a14
                  on         (a12.row_current_key = a14.row_current_key)
 join        ldb.d_employee_location            a18
                  on         (a14.location_key = a18.row_key)
				  union
				  
 select'd_lov_asset_life_cycle_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_asset_people_c             a11   	  
	    join        ldb.d_asset        a13
                  on         (a11.asset_key = a13.row_key)
  join        ldb.d_lov_asset_life_cycle_c      a17
                  on         (a13.asset_status_key = a17.row_key)
				  union
				           select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_asset_people_c             a11 
join ldb.d_internal_contact         a12
on         (a11.employee_key = a12.row_key)
      join        ldb.d_internal_organization_department             a16
                  on         (a12.department_key = a16.row_key)
		  
		  union
		  
    select'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_asset_people_c             a11 
  join        ldb.d_configuration_item            a15
                  on         (a11.configuration_item_key = a15.row_key)
				  union 
				  
				  
				   select'f_asset_people_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_asset_people_c             a11 
                join        ldb.d_asset        a13
                  on         (a11.asset_key = a13.row_key)
				  
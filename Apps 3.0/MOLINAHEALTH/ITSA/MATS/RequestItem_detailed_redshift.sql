 select'f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 union
 select'd_internal_contact_fulfilled_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join        ldb.d_internal_contact_fulfilled_by_c   a111
                  on         (a11.fulfilled_by_c_key = a111.row_key)
union
 select'd_request_item_hr_category_src_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join        ldb.d_request_item_hr_category_src_c                  a111
                  on         (a11.category_src_c_key  = a111.row_key)
				  union
				   select'd_business_unit_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join        ldb.d_configuration_item            a12
                  on         (a11.configuration_item_key = a12.row_key)
                join        ldb.d_business_unit_c   a13
                  on         (a12.business_unit_c_key = a13.row_key)
 
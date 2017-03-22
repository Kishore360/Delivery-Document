  select'f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 union
 select'd_request_item_variable_building' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_request_item_variable_building       a12
on (a11.building = a12.row_key)
 union
 select'd_request_item_variable_campus' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_request_item_variable_campus       a12
on (a11.campus= a12.row_key)
 union
 select'd_request_item_variable_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_request_item_variable_v_department       a12
on (a11.v_department = a12.row_key)

 union
 select'd_variable_lov_c_u_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left join  ldb.d_variable_lov_c_u_request_type        a12
on (a11. u_request_type = a12.row_key)




 union
 select'd_request_item_variable_requested_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_request_item_variable_requested_for        a12
on (a11. requested_for_c = a12.row_key)
 union
 select'd_request_item_variable_u_room' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_request_item_variable_u_room         a12
on (a11.request_item_key = a12.row_key)
union
 select'd_request_item_variable_room' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_request_item_variable_room         a12
on (a11.request_item_key= a12.row_key)

union
 select'd_variable_lov_c_v_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_variable_lov_c_v_request_type         a12
on (a11. v_request_type = a12.row_key)
union
 select'd_variable_lov_c_u_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_variable_lov_c_u_request_category         a12
on (a11. u_request_category = a12.row_key)

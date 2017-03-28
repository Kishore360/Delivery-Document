
select'd_request_item_variable_v_room' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_request_item_variable_v_room         a12
on (a11.request_item_key = a12.row_key)
 union
 select'd_variable_lov_c_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_variable_lov_c_request_type         a12
on (a11.request_type = a12.row_key)
 union
 select'd_request_item_variable_u_room_number' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_request_item_variable_u_room_number         a12
on (a11.request_item_key = a12.row_key)
union
 select'd_request_item_variable_u_support_group_school' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_request_item_variable_u_support_group_school         a12
on (a11. u_support_group_school = a12.row_key)
union
 select'd_request_item_variable_urgent' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_request_item_variable_urgent          a12
on (a11.request_item_key = a12.row_key)

union
 select'd_variable_lov_c_v_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_variable_lov_c_v_request_category         a12
on (a11. v_request_category = a12.row_key)
UNION 
select'd_internal_contact_variable_requested_for_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_item             a11 
left outer join  ldb.d_internal_contact_variable_requested_for_c a12
on (a11.requested_for_c = a12.row_key)
UNION 
select'd_location_variable_campus_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_item             a11 
left outer join  ldb.d_location_variable_campus_c a12
on (a11.campus = a12.row_key)

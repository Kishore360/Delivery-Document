select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_change_request       a11 
 union

select'ldb.d_lov_change_request_service_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_change_request       a11 
join ldb.d_lov_change_request_service_type_c       a12
on (a11.service_type_src_c_key = a12.row_key)

union
select'ldb.d_lov_change_request_require_downtime_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_change_request       a11 
join ldb.d_lov_change_request_require_downtime_c       a12
on (a11.require_downtime_src_c_key = a12.row_key)

union
select'ldb.d_lov_change_request_multi_service_impact_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_change_request       a11 
join ldb.d_lov_change_request_multi_service_impact_c       a12
on (a11.multi_service_impact_src_c_key = a12.row_key)


union
select'ldb.d_lov_change_request_capability_to_detect_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_change_request       a11 
join ldb.d_lov_change_request_capability_to_detect_c       a12
on (a11.capability_to_detect_src_c_key = a12.row_key)


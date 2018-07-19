select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_internal_contact       a11 
union
select'ldb.d_location_user_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_internal_contact       a11 
join ldb.d_location_user_c       a12
on (a11.location_key = a12.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_internal_contact       a11 
join ldb.d_internal_organization_department       a13
on (a11.department_key = a13.row_key)

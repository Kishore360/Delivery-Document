

select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_customerservice_case_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customerservice_case_c a12 
on (a11.customerservice_case_c_key = a12.row_key) 
union
select 'ldb.d_tribe_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_tribe_c a12 
on (a11.tribe_c_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_tribe_c a12 
on (a11.tribe_c_key = a12.row_key) 
join ldb.d_segment_c d2 on a12.segment_c_key=d2.row_key
join ldb.d_internal_contact_assigned_to d3
on d3.row_key = d2.general_manager_c_key
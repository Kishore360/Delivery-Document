select 'ldb.d_configuration_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a11
union
select 'ldb.d_internal_contact_executive_supervisor_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a11 
join ldb.d_internal_contact_executive_supervisor_c a12 
on (a11.executive_sponsor_c_key = a12.row_key)
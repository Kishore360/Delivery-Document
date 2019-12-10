select 'ldb.f_o_print_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_o_print_c a11 
 union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_o_print_c a11 
 join ldb.d_calendar_date a12 
	on (a11.row_c_key = a12.row_key)  
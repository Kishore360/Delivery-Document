select 'ldb.f_n_expense_item_weekly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_expense_item_weekly a11 
union
select 'ldb.d_calendar_week a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_expense_item_weekly a11 
join ldb.d_calendar_week a12 
on (a11.n_key = a12.row_key) 
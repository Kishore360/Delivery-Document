select 'ldb.f_n_expense_item_quarterly' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_expense_item_quarterly a11 
union
select 'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_expense_item_quarterly a11 
join ldb.d_calendar_quarter a12
on (a11.n_key=a12.row_key)select 'ldb.f_n_expense_item_quarterly' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_expense_item_quarterly a11 
union
select 'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_expense_item_quarterly a11 
join ldb.d_calendar_quarter a12
on (a11.n_key=a12.row_key)
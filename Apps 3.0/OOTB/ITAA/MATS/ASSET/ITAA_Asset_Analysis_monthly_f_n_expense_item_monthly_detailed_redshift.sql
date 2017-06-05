select 'ldb.f_n_expense_item_monthly' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_expense_item_monthly a11 
union
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_expense_item_monthly a11 
join ldb.d_calendar_month a12
on (a11.n_key=a12.row_key)
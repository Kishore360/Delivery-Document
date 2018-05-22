select 'ldb.f_expense_item' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_expense_item a11 
union
select 'ldb.d_lov_expense_category_view' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_expense_item a11 
join ldb.d_lov_expense_category_view a12
on (a11.expense_item_category_key=a12.row_key)
union
select 'ldb.d_lov_expense_summary_type_view' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_expense_item a11 
join ldb.d_lov_expense_summary_type_view a12
on (a11.expense_summary_type_key=a12.row_key)
union
select 'ldb.d_lov_expense_type_view' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_expense_item a11 
join ldb.d_lov_expense_type_view a12
on (a11.expense_type_key=a12.row_key)
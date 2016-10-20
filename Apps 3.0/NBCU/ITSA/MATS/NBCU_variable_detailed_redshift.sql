
select'ldb.f_request_item_variable_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_variable_c       a11 
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_variable_c       a11 
join ldb.d_master_item       a12
on (a11.catalog_item_key=a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_variable_c       a11 
join ldb.d_calendar_date       a13
on (a11.opened_on_key=a13.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_variable_c       a11 
join ldb.d_request_item       a14
on (a11.request_item_key=a14.row_key)
union
select'ldb.d_variable_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_variable_c       a11 
join ldb.d_variable_c       a15
on (a11.variable_key=a15.row_key)
union
select'ldb.d_question_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_variable_c       a11 
join ldb.d_question_type       a16
on (a11.question_type_src_key=a16.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_variable_c       a11 
 join ldb.d_calendar_date       a13
on (a11.opened_on_key=a13.row_key)
join ldb.d_calendar_month       a17
on (a13.month_start_date_key=a17.row_key)


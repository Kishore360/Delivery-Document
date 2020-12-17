select 'ldb.f_nct_ticket_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_nct_ticket_c a11 
 union
select 'ldb.d_nct_ticket_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_nct_ticket_c a11 
 join ldb.d_nct_ticket_c a12 
    on (a11.nct_ticket_c_key = a12.row_key)  
 union
select 'ldb.d_nct_ticket_window_start_date_c a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_nct_ticket_c a11 
 join ldb.d_nct_ticket_c a12 
 on (a11.nct_ticket_c_key = a12.row_key) 
    join ldb.d_nct_ticket_window_start_date_c a13 
    on (a12.nct_ticket_window_start_date_c_key = a13.row_key)  
 union
select 'ldb.d_lov_nct_ticket_auto_coordinated_c a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_nct_ticket_c a11 
 join ldb.d_nct_ticket_c a12 
 on (a11.nct_ticket_c_key = a12.row_key) 
    join ldb.d_lov_nct_ticket_auto_coordinated_c a14 
    on (a12.nct_ticket_auto_coordinated_c_key = a14.row_key)  
 union
select 'ldb.d_lov_nct_ticket_status_c a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_nct_ticket_c a11 
 join ldb.d_nct_ticket_c a12 
 on (a11.nct_ticket_c_key = a12.row_key) 
    join ldb.d_lov_nct_ticket_status_c a15 
    on (a12.nct_ticket_status_c_key = a15.row_key) 
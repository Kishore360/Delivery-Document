select 'ldb.f_keyword_yammer_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_keyword_yammer_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_keyword_yammer_c a11 
join ldb.d_calendar_date a12 
on (a11.message_created_on_key = a12.row_key) 
union
select 'ldb.d_messages_yammer_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_keyword_yammer_c a11 
join ldb.d_messages_yammer_c a13 
on (a11.table_row_key = a13.row_key) 
union
select 'ldb.d_internal_contact_user_yammer_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_keyword_yammer_c a11 
join ldb.d_messages_yammer_c a13 
on (a11.table_row_key = a13.row_key) 
join ldb.d_internal_contact_user_yammer_c a14 
on (a13.sender_key = a14.row_key) 
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_keyword_yammer_c a11 
join ldb.d_calendar_date a12 
on (a11.message_created_on_key = a12.row_key) 
join ldb.d_calendar_month a15 
on (a12.month_start_date_key = a15.row_key) 
union
select 'ldb.d_internal_contact_master_employee_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_keyword_yammer_c a11 
join ldb.d_messages_yammer_c a13 
on (a11.table_row_key = a13.row_key) join ldb.d_internal_contact_user_yammer_c a14 
on (a13.sender_key = a14.row_key) 
join ldb.d_internal_contact_master_employee_c a16 
on (a14.bmc_row_key_c = a16.row_key) 
union
select 'ldb.d_internal_organization_groups_yammer_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_keyword_yammer_c a11 
join ldb.d_messages_yammer_c a13 
on (a11.table_row_key = a13.row_key) 
join ldb.d_internal_organization_groups_yammer_c a17 
on (a13.group_key = a17.row_key) 

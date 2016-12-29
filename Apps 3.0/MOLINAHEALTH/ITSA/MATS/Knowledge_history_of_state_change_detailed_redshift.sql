select 'ldb.f_kb_knowledge_state_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_state_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_state_c a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
union
select 'ldb.d_kb_knowledge_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_state_c a11 
join ldb.d_kb_knowledge_c a13 
on (a11.kb_knowledge_c_key = a13.row_key) 
union
select 'ldb.d_internal_contact_knowledge_assigned_to_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_state_c a11 
join ldb.d_internal_contact_knowledge_assigned_to_c a14 
on (a11.knowledge_assigned_to_c_key = a14.row_key) 
union
select 'ldb.d_internal_contact_knowledge_author_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_state_c a11 
join ldb.d_internal_contact_knowledge_author_c a15 
on (a11.knowledge_author_c_key = a15.row_key) 
union
select 'ldb.d_lov_knowledge_new_state_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_state_c a11 
join ldb.d_lov_knowledge_new_state_c a16 
on (a11.new_state_src_key = a16.row_key) 
union
select 'ldb.d_lov_knowledge_old_state_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_state_c a11 
join ldb.d_lov_knowledge_old_state_c a17 
on (a11.old_state_src_key = a17.row_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_state_c a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_month a18 
on (a12.month_start_date_key = a18.row_key) 
union
select 'ldb.d_internal_organization_knowledge_owning_group_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_state_c a11 
join ldb.d_internal_organization_knowledge_owning_group_c a19 
on (a11.knowledge_owning_group_c_key = a19.row_key) 
union
select 'ldb.d_lov_knowledge_state_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_state_c a11 
join ldb.d_kb_knowledge_c a13 
on (a11.kb_knowledge_c_key = a13.row_key) 
join ldb.d_lov_knowledge_state_c a110 
on (a13.knowledge_state_src_c_key = a110.row_key) 

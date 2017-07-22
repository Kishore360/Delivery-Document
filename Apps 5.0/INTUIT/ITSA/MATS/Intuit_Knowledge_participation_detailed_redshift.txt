select 'ldb.f_kb_knowledge_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_kb_knowledge_c a11 
union
select 'ldb.d_kb_knowledge_c a13 ' as Table_name, count(1) Row_Count
from ldb.f_kb_knowledge_c a11 
join ldb.d_kb_knowledge_c a13 
on (a11.knowledge_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(1) Row_Count
from ldb.f_kb_knowledge_c a11 
join ldb.d_kb_knowledge_c a13 
on (a11.knowledge_key = a13.row_key) 
join ldb.d_internal_contact a14 
on (a13.author_key = a14.row_key) 
union
select 'ldb.d_kb_knowledge_workflow_state_c a15 ' as Table_name, count(1) Row_Count
from ldb.f_kb_knowledge_c a11 
join ldb.d_kb_knowledge_c a13 
on (a11.knowledge_key = a13.row_key) 
join ldb.d_kb_knowledge_workflow_state_c a15 
on (a13.workflow_state_key = a15.row_key) 
select 'ldb.f_kb_knowledge_hr_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_hr_c a11 
union
select 'ldb.d_kb_knowledge_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_hr_c a11 
join ldb.d_kb_knowledge_c a12 
on (a11.d_kb_knowledge_c_key = a12.row_key) 
union
select 'ldb.d_internal_contact_author_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_hr_c a11 
join ldb.d_internal_contact_author_c a13 
on (a11.author_c_key = a13.row_key) 
union
select 'ldb.d_kb_knowledge_base_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_hr_c a11 
join ldb.d_kb_knowledge_base_c a14 
on (a11.kb_knowledge_base_c_key = a14.row_key) 
union
select 'ldb.d_internal_organization_limit_to_group_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_hr_c a11 
join ldb.d_internal_organization_limit_to_group_c a15 
on (a11.limit_to_group_c_key = a15.row_key) 
union
select 'ldb.d_internal_contact_public_access_requestor_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_hr_c a11 
join ldb.d_internal_contact_public_access_requestor_c a16 
on (a11.public_access_requestor_c_key = a16.row_key) 
union
select 'ldb.d_lov_category_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_hr_c a11 
join ldb.d_kb_knowledge_c a12 
on (a11.d_kb_knowledge_c_key = a12.row_key) 
join ldb.d_lov_category_c a17 
on (a12.category_src_c_key = a17.row_key) 
union
select 'ldb.d_lov_workflow_state_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_hr_c a11 
join ldb.d_kb_knowledge_c a12 
on (a11.d_kb_knowledge_c_key = a12.row_key) 
join ldb.d_lov_workflow_state_c a18 
on (a12.workflow_state_src_c_key = a18.row_key) 
union
select 'ldb.d_lov_article_type_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_hr_c a11 
join ldb.d_kb_knowledge_c a12 
on (a11.d_kb_knowledge_c_key = a12.row_key) 
join ldb.d_lov_article_type_c a19 
on (a12.article_type_src_c_key = a19.row_key) 
union
select 'ldb.d_lov_topic_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_hr_c a11 
join ldb.d_kb_knowledge_c a12 
on (a11.d_kb_knowledge_c_key = a12.row_key) 
join ldb.d_lov_topic_c a110 
on (a12.topic_src_c_key = a110.row_key) 


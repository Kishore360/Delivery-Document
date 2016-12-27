
select 'ldb.f_kb_knowledge_c ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_c a11 
union
select 'ldb.d_kb_knowledge_c  ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_kb_knowledge_c a11
join ldb.d_kb_knowledge_c a12
 on (a11.knowledge_c_key = a12.row_key)
 union
select 'ldb.d_internal_contact_author_c  ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_kb_knowledge_c a11
join ldb.d_internal_contact_author_c a13
 on (a11.author_c_key = a13.row_key)
 union
select 'ldb.d_kb_knowledge_c_category  ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_kb_knowledge_c a11
join ldb.d_kb_knowledge_c_category a14
 on (a11.category_src_key = a14.row_key)
 union
select 'ldb.d_internal_organization_group  ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_kb_knowledge_c a11
join ldb.d_internal_organization_group a15
 on (a11.group_key = a15.row_key)
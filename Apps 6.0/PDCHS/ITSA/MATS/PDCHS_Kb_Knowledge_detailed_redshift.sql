
select 'ldb.f_kb_knowledge_c a11' as Table_name, count(a11.row_key) Row_Count 
from ldb.f_kb_knowledge_c a11
union
select 'ldb.d_kb_knowledge_c a12' as Table_name, count(a11.row_key) Row_Count 
from ldb.f_kb_knowledge_c a11
join  ldb.d_kb_knowledge_c a12
  on (a11.kb_knowledge_c_key = a12.row_key)
union
select 'ldb.d_knowledge_category_c a13' as Table_name, count(a11.row_key) Row_Count 
from ldb.f_kb_knowledge_c a11
join  ldb.d_knowledge_category_c a13
  on (a11.knowledge_category_c_key = a13.row_key)
union
select 'ldb.d_knowledge_author_c a14' as Table_name, count(a11.row_key) Row_Count 
from ldb.f_kb_knowledge_c a11
join  ldb.d_knowledge_author_c a14
  on (a11.knowledge_author_c_key = a14.row_key)
union
select 'ldb.d_knowledge_group_c a15' as Table_name, count(a11.row_key) Row_Count 
from ldb.f_kb_knowledge_c a11
join  ldb.d_knowledge_group_c a15
  on (a11.knowledge_group_c_key = a15.row_key)
union
select 'ldb.d_lov_knowledge_kb_category_c a16' as Table_name, count(a11.row_key) Row_Count 
from ldb.f_kb_knowledge_c a11
join  ldb.d_kb_knowledge_c a12
  on (a11.kb_knowledge_c_key = a12.row_key)
join  ldb.d_lov_knowledge_kb_category_c a16
  on (a12.category_c_key = a16.row_key)
union
select 'ldb.d_lov_knowledge_kb_category_c a16' as Table_name, count(a11.row_key) Row_Count 
from ldb.f_kb_knowledge_c a11
join  ldb.d_kb_knowledge_c a12
  on (a11.kb_knowledge_c_key = a12.row_key)
join  ldb.d_lov_knowledge_topic_c a17
  on (a12.topic_c_key = a17.row_key)



 select'f_kb_knowledge_roles_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_kb_knowledge_roles_c             a11 
 union
  select'd_kb_knowledge_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_kb_knowledge_roles_c             a11 
 join ldb.d_kb_knowledge_c a12 on a11.kb_knowledge_c_key = a12.row_key
 union
  select'd_user_roles_c_knowledge_roles_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_kb_knowledge_roles_c             a11 
 join ldb.d_user_roles_c_knowledge_roles_c a12 on a11.user_roles_c_key = a13.row_key
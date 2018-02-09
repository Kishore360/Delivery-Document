SELECT 'f_kb_knowledge_roles_c' as Table_Name,count(1) as Row_count
FROM ldb.f_kb_knowledge_roles_c a 
UNION 
SELECT 'd_kb_knowledge_c' as Table_Name,count(1) as Row_count
FROM ldb.f_kb_knowledge_roles_c a 
JOIN ldb.d_kb_knowledge_c b ON a.kb_knowledge_c_key=b.row_key
UNION 
SELECT 'd_user_roles_c_knowledge_roles_c' as Table_Name,count(1) as Row_count
FROM ldb.f_kb_knowledge_roles_c a 
JOIN ldb.d_user_roles_c_knowledge_roles_c b ON a.user_roles_c_key=b.row_key

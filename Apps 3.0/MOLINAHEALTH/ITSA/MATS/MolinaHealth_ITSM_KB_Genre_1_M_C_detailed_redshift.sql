SELECT 'f_kb_knowledge_genre_c' as Table_Name,count(1) as Row_count
FROM ldb.f_kb_knowledge_genre_c a 
UNION 
SELECT 'd_lov_knowledge_genre_c' as Table_Name,count(1) as Row_count
FROM ldb.f_kb_knowledge_genre_c a 
JOIN ldb.d_lov_knowledge_genre_c b ON a.knowledge_genre_c_key=b.row_key
UNION 
SELECT 'd_kb_knowledge_c' as Table_Name,count(1) as Row_count
FROM ldb.f_kb_knowledge_genre_c a 
JOIN ldb.d_kb_knowledge_c b ON a.kb_knowledge_c_key=b.row_key
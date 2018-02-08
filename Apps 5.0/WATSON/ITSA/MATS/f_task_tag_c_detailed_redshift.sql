  
SELECT 'f_task_tag_c' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_task_tag_c a11 
UNION 
SELECT 'd_task_tag_c' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_task_tag_c a11 
JOIN ldb.d_task_tag_c a12 ON a11.task_tag_c_key = a12.row_key
UNION 
SELECT 'd_task' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_task_tag_c a11 
JOIN ldb.d_task a13 ON a11.task_key = a13.row_key
UNION 
SELECT 'd_lov_tag_type_c' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_task_tag_c a11 
 join        ldb.d_task_tag_c             a12
                  on         (a11.task_tag_c_key = a12.row_key)
join        ldb.d_lov_tag_type_c    a14
                  on         (a12.tag_type_src_c_key = a14.row_key)
				  union
				SELECT 'd_lov_tag_viewable_by_c' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_task_tag_c a11 
 join        ldb.d_task_tag_c             a12
                  on         (a11.task_tag_c_key = a12.row_key)  
				   join        ldb.d_lov_tag_viewable_by_c    a15
                  on         (a12.viewable_by_src_c_key = a15.row_key)
				  union
				  SELECT 'd_lov_task_type_c' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_task_tag_c a11 
 join        ldb.d_task_tag_c             a12
                  on         (a11.task_tag_c_key = a12.row_key)  
				   join        ldb.d_lov_task_type_c  a16
                  on         (a12.task_type_src_key = a16.row_key)
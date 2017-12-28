


SELECT 'f_problem_task' as Table_Name, Count(1) as Row_Count 
FROM ldb.f_problem_task a 
UNION 
SELECT 'f_problem_task_journal_c' as Table_Name, Count(1) as Row_Count 
FROM ldb.f_problem_task a 
JOIN ldb.f_problem_task_journal_c b ON a.problem_task_key=b.problem_task_key
UNION 
SELECT 'd_problem_task' as Table_Name, Count(1) as Row_Count 
FROM ldb.f_problem_task a
JOIN ldb.d_problem_task b ON a.problem_task_key=b.row_key
UNION 
SELECT 'd_problem_task_journal_c' as Table_Name,Count(1) as Row_Count
FROM ldb.f_problem_task a 
JOIN ldb.f_problem_task_journal_c b ON a.problem_task_key=b.problem_task_key
JOIN ldb.d_problem_task_journal_c c ON b.problem_task_journal_c_key=c.row_key

SELECT 'f_problem_journal_c' as Table_Name,count(1) as Row_count
FROM ldb.f_problem_journal_c a 
UNION 
SELECT 'd_problem' as Table_Name,count(1) as Row_count
FROM ldb.f_problem_journal_c a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key 
UNION 
SELECT 'd_problem_journal_c' as Table_Name,count(1) as Row_count
FROM ldb.f_problem_journal_c a 
JOIN ldb.d_problem_journal_c c ON a.problem_journal_c_key=c.row_key
UNION 
SELECT 'd_calendar_date' as Table_Name,count(1) as Row_count
FROM ldb.f_problem_journal_c a 
JOIN ldb.d_calendar_date b ON a.created_on_c_key=b.row_key
UNION 
SELECT 'd_calendar_month' as Table_Name,count(1) as Row_count
FROM ldb.f_problem_journal_c a 
JOIN ldb.d_calendar_date b ON a.created_on_c_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
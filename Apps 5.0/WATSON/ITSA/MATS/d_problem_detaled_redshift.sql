

select 'ldb.d_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_problem a11 
union
select 'ldb.d_problem_affected_activity_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_problem a11 
join ldb.d_problem_affected_activity_c a12 
on (a11.affected_activity_src_c_key = a12.row_key) 
union
select 'ldb.d_problem_detection_source_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_problem a11 
join ldb.d_problem_detection_source_c a12 
on (a11.detection_source_src_c_key = a12.row_key) 
union
select 'ldb.d_problem_root_cause_codes_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_problem a11 
join ldb.d_problem_root_cause_codes_c a12 
on (a11.root_cause_codes_src_c_key = a12.row_key) 

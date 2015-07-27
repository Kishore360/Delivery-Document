SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (

select 'f_project_c'as Table_Name,count(a11.row_key) Row_Count
from ldb.f_project_c	a11

union

select  'd_project'as Table_Name,count(a11.row_key) Row_Count
from ldb.f_project_c	a11
   join        ldb.d_project	a12
   on 	(a11.project_c_key = a12.row_key)
)B
)A

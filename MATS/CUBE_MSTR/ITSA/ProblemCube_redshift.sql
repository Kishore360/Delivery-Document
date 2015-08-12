 SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'f_problem' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11

union


select  'd_problem_state' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem     a11 	join    ldb.d_problem_state   a15
                  on         (a11.state_src_key  = a15.row_key)

union

select  'd_problem' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_problem  a16
        on         (a11.problem_key = a16.row_key)
union

select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_internal_contact a18
        on         (a11.opened_by_key  = a18.row_key)

union

select  'd_calendar_time' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_calendar_time a20
        on         (a11.opened_time_key  = a20.row_key)

union

select  'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join	ldb.d_calendar_date	a21
	  on 	(a11.opened_on_key = a21.row_key)
	join	ldb.d_calendar_month	a22
	  on 	(a21.month_start_date_key = a22.row_key)

union

select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_calendar_date a23
        on         (a11.opened_on_key  = a23.row_key)


)a
)b

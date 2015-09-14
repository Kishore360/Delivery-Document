


select  count(1) open_problems
, sum(case when problem_tasks_count>0 then 1 else 0 end) problem_task
,month_name,week_name,quarter_name,year_name
from <<tenant>>_mdwdb.f_problem F
join <<tenant>>_mdwdb.d_problem D
on(D.row_key=F.problem_key)
join <<tenant>>_mdwdb.d_calendar_date LKP
on(LKP.row_key=F.opened_on_key
and LKP.source_id = 0)
group by month_name,week_name,quarter_name,year_name;


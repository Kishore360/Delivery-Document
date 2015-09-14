


select sum(problem_tasks_count)/count(1) as avg_problem_tasks_count,month_name,week_name,quarter_name,year_name,sum( case when problem_tasks_count>0 then 1 else 0 end)
from <<tenant>>_mdwdb.f_problem F
join <<tenant>>_mdwdb.d_problem D
on(D.row_key=F.problem_key)
join <<tenant>>_mdwdb.d_lov L
on(F.state_src_key=L.row_key)
join <<tenant>>_mdwdb.d_lov_map LM
on(LM.src_key=L.row_key)
join <<tenant>>_mdwdb.d_calendar_date LKP
on(LKP.row_key=F.opened_on_key
and LKP.source_id = 0)
--  where lagging_count_of_month in(0,1)
group by month_name,week_name,quarter_name,year_name;


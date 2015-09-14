


select sum(F.reassignment_count)/count(1) as avg_reassignment_count,month_name,week_name,quarter_name,year_name,sum(F.reassignment_count),count(1) 
from <<tenant>>_mdwdb.f_problem F
join <<tenant>>_mdwdb.d_problem D
on(D.row_key=F.problem_key)
join <<tenant>>_mdwdb.d_calendar_date LKP
on(LKP.row_key=F.opened_on_key
and LKP.source_id = 0)
--  where lagging_count_of_month in(0,1)
group by month_name,week_name,quarter_name,year_name;


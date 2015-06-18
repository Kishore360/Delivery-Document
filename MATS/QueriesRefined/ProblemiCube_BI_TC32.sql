


select  count(1) open_problems
, sum(case when knowledge_flag= 'Y' then 0 else 1 end) knowledge_problems
, sum(case when backlog_flag= 'Y' then 0 else 1 end) backlog_problems
, sum(case when known_error_flag= 'Y' then 0 else 1 end) know_error_problems
, sum(case when dormant_flag= 'Y' then 0 else 1 end) dormant_problems
,month_name,week_name,quarter_name,year_name
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
group by month_name,week_name,quarter_name,year_name;


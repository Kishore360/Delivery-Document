


select sum(case when dimension_wh_code='RESOLVED' then 1 else 0 end) closed_problems,count(1) open_problems, STR_TO_DATE(due_on_key,'%Y%m%d') as due-date
from <<tenant>>_mdwdb.f_problem F
join <<tenant>>_mdwdb.d_problem D
on(D.row_key=F.problem_key)
join <<tenant>>_mdwdb.d_lov L
on(F.state_src_key=L.row_key)
join <<tenant>>_mdwdb.d_lov_map LM
on(LM.src_key=L.row_key)
join <<tenant>>_mdwdb.d_calendar_date LKP
on(LKP.row_key=F.due_on_key
and LKP.source_id = 0)
--  where STR_TO_DATE(due_on_key,'%Y%m%d') > date_format(now(),'%Y%m%d')-300
group by STR_TO_DATE(due_on_key,'%Y%m%d');


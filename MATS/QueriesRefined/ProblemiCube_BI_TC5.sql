

select sum(case when dimension_wh_code='RESOLVED' then 1 else 0 end) closed_problems
,count(1) open_problems
,LKP.category,LKP.ci_type,LKP.class
from <<tenant>>_mdwdb.f_problem F
join <<tenant>>_mdwdb.d_problem D
on(D.row_key=F.problem_key)
join <<tenant>>_mdwdb.d_lov L
on(F.state_src_key=L.row_key)
join <<tenant>>_mdwdb.d_lov_map LM
on(LM.src_key=L.row_key)
join <<tenant>>_mdwdb.d_configuration_item LKP
on(LKP.row_key=F.configuration_item_key)
group by LKP.category,LKP.ci_type,LKP.class;


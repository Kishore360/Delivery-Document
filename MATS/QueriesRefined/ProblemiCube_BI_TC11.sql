


select (sum(case when met_sla_flag= 'Y' then 1 else 0 end)/count(1))1100,LMP.dimension_wh_code as priority,count(1) 
from <<tenant>>_mdwdb.f_problem F
join <<tenant>>_mdwdb.d_problem D
on(D.row_key=F.problem_key)
join <<tenant>>_mdwdb.d_lov LP
on(F.priority_src_key=LP.row_key)
join <<tenant>>_mdwdb.d_lov_map LMP
on(LMP.src_key=LP.row_key)
join <<tenant>>_mdwdb.d_lov L
on(F.state_src_key=L.row_key)
join <<tenant>>_mdwdb.d_lov_map LM
on(LM.src_key=L.row_key)
where LM.dimension_wh_code='RESOLVED'
group by LMP.dimension_wh_code;


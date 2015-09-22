


select count(1) open_problems
, sum(case when change_flag= 'Y' then 1 else 0 end) problem_resolved_by_change
,organization_name as assignment_group 
from <<tenant>>_mdwdb.f_problem F
join <<tenant>>_mdwdb.d_problem D
on(D.row_key=F.problem_key)
join <<tenant>>_mdwdb.d_internal_organization LKP
on(LKP.row_key=F.assignment_group_key)
join <<tenant>>_mdwdb.d_lov L
on(F.state_src_key=L.row_key)
join <<tenant>>_mdwdb.d_lov_map LM
on(LM.src_key=L.row_key)
where LM.dimension_wh_code ='RESOLVED'
group by organization_name;


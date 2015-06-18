



select sum(F.age)/count(1) as avg_age,organization_name,LMP.dimension_wh_code as priority,LMS.dimension_wh_code as state,sum(F.age),count(1) 
from <<tenant>>_mdwdb.f_problem F
join <<tenant>>_mdwdb.d_problem D
on(D.row_key=F.problem_key)
join <<tenant>>_mdwdb.d_lov LP
on(F.priority_src_key=LP.row_key)
join <<tenant>>_mdwdb.d_lov_map LMP
on(LMP.src_key=LP.row_key)
join <<tenant>>_mdwdb.d_lov LS
on(F.state_src_key=LS.row_key)
join <<tenant>>_mdwdb.d_lov_map LMS
on(LMS.src_key=LS.row_key)
join <<tenant>>_mdwdb.d_internal_organization LKP
on(LKP.row_key=F.assignment_group_key)
--  where lagging_count_of_month in(0,1)
group by organization_name;


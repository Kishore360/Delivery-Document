



select count(1) open_problems
, sum(case when linked_incident_flag= 'Y' then 1 else 0 end) problem_linked_incident
, sum(case when linked_incident_flag= 'Y' then 0 else 1 end) problem_without_linked_incident
,organization_name as assignment_group 
from <<tenant>>_mdwdb.f_problem F
join <<tenant>>_mdwdb.d_problem D
on(D.row_key=F.problem_key)
join <<tenant>>_mdwdb.d_internal_organization LKP
on(LKP.row_key=F.assignment_group_key)
group by organization_name;


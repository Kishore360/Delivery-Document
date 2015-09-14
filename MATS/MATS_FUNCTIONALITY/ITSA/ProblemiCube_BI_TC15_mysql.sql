


select sum(F.reassignment_count)/count(1) as avg_reassignment_count
,LKP.organization_name as assignment_group
,LKP1.organization_name as assignment_group1,LKP2.organization_name as assignment_group2
,LKP3.organization_name as assignment_group3,LKP4.organization_name as assignment_group4
from <<tenant>>_mdwdb.f_problem F
join <<tenant>>_mdwdb.d_problem D
on(D.row_key=F.problem_key)
join <<tenant>>_mdwdb.d_internal_organization LKP
on(LKP.row_key=F.assignment_group_key)
--  where lagging_count_of_month in(0,1)
join <<tenant>>_mdwdb.d_h_all_hierarchies AGH
 ON LKP.row_key=AGH.lev_0_key
left join <<tenant>>_mdwdb.d_internal_organization LKP1
 ON LKP1.row_key=AGH.lev_1_key
left join <<tenant>>_mdwdb.d_internal_organization LKP2
 ON LKP2.row_key=AGH.lev_2_key
left join <<tenant>>_mdwdb.d_internal_organization LKP3
 ON LKP3.row_key=AGH.lev_3_key
left join <<tenant>>_mdwdb.d_internal_organization LKP4
 ON LKP4.row_key=AGH.lev_4_key
 where  AGH.hierarchy_class='ASSIGNMENT GROUP TIER'
group by  LKP.organization_name;


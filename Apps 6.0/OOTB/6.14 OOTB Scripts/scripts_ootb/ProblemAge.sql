select dio.organization_name as "Assignment group" , '' as metrics,
-- concat(cast(cast(sum(fp.age) as decimal(10,2))/count(fp.row_key) as decimal(10,1)) ,' days') as "avg age"
concat(round((sum(fp.age)/86400.00)/count(fp.row_key), 1),' days') as "avg age"
from #DWH_TABLE_SCHEMA.f_problem fp
left join #DWH_TABLE_SCHEMA.d_problem dp
on fp.problem_key = dp.row_key
left join #DWH_TABLE_SCHEMA.d_internal_organization dio
on fp.assignment_group_key = dio.row_key
left join #DWH_TABLE_SCHEMA.d_lov dv
on dv.row_key = fp.state_src_key
group by dio.organization_name 
order by dio.organization_name
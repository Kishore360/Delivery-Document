select dp.reassignment_count as "reassignment count" ,dv.dimension_name as "state", dcd1.quarter_name , dcd1.month_name, dp.source_url, '' as metrics , 
sum(dp.reassignment_count) as problem_reassignment,
sum(case when dp.priority_escalated_flag = 'Y'then 1 else 0 end)as"Priority escalated flags", 
sum(case when dp.known_error_flag = 'Y'then 1 else 0 end )as "known error"
from #DWH_TABLE_SCHEMA.f_problem fp
left join #DWH_TABLE_SCHEMA.d_problem dp
on fp.problem_key = dp.row_key
left join #DWH_TABLE_SCHEMA.d_internal_organization dio
on fp.opened_by_department_key = dio.row_key
left join #DWH_TABLE_SCHEMA.d_lov dv
on dv.row_key = fp.state_src_key
left join #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd1
on  fp.opened_on_key = dcd1.row_key
--left join #DWH_TABLE_SCHEMA.d_calendar_date dcd2 
--on fp.closed_on_key = dcd2.row_key
group by dp.reassignment_count,dv.dimension_name ,dcd1.quarter_name ,dcd1.month_name, dp.source_url
order by dp.source_url asc

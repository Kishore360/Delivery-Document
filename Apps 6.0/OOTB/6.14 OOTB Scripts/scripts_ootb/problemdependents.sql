select
dp.source_url ,dp.knowledge_flag as "Knowledge",dcr.change_request_number , '' as metrics ,
sum(fp.linked_incident_count) as "Related incidents",
 dp.linked_incident_flag as " Problem without Related incidents",
 sum(case when dvm.dimension_wh_code in ('RESOLVED','CLOSED') and dp.change_flag = 'Y' then 1 else 0 end) as "Problems resolved by change" 
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
 join #DWH_TABLE_SCHEMA.d_change_request dcr
on fp.change_request_key = dcr.row_key
group by dp.reassignment_count,dv.dimension_name ,dcd1.quarter_name ,dcd1.month_name, dp.source_url,dp.knowledge_flag,dcr.change_request_number,dp.linked_incident_flag
order by dp.source_url asc

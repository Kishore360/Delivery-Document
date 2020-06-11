select dio.organization_name as "department",dcd1.week_name as "Calendar Week" ,dcd1.year_name, '' as metrics,
count(case when dvm.dimension_wh_code = 'OPEN' and dp.met_sla_flag = 'Y'THEN 1 else null end) as "Open Problems met Sla",
count(case when dvm.dimension_wh_code = 'OPEN' and dp.met_sla_flag = 'N'THEN 1 else null end) as "Open Problems missed Sla",
concat(round(cast(sum(CASE WHEN dvm.dimension_wh_code in( 'RESOLVED','CLOSED') and dp.met_sla_flag = 'Y' THEN 1 ELSE NULL end)as numeric)/
cast(sum(case when dvm.dimension_wh_code in ( 'RESOLVED','CLOSED') then 1 else NULL end)as numeric) *100 :: integer),'%') as "percentage of closed problems met sla"
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
group by dcd1.week_name,dcd1.year_name,dio.organization_name
--order by dio.organization_name 





select dio.row_key as "company" ,
'' as metric,
sum(case when di.problem_flag = 'Y'then 1 else 0 end )as "Incidents caused by problem",
sum(case when di.caused_by_change_flag = 'Y' then 1 else 0 end) as "Incidents caused by change",
sum(case when di.knowledge_flag = 'Y' then 1 else 0 end) as "Incidents causing knowledge",
sum(case when di.change_flag = 'Y'then 1 else 0 end )as "Incidents pending change",

sum(case when dvm.dimension_wh_code='CLOSED' and di.change_flag = 'Y' then 1 else 0 end )
as "Incidents resolved by change" from  #DWH_TABLE_SCHEMA.f_incident fi 
join #DWH_TABLE_SCHEMA.d_internal_contact dc
on  fi.opened_by_key = dc.row_key
join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key
join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on  fi.opened_on_key = dcd.row_key
 join #DWH_TABLE_SCHEMA.d_internal_organization dio 
on fi.company_key = dio.row_key
left join  #DWH_TABLE_SCHEMA.d_lov  dv 
on fi.state_src_key  = dv.row_key
left join  #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
left join #DWH_TABLE_SCHEMA.d_domain dom
on dom.row_key = fi.domain_key
where dcd.lagging_count_of_month between 0 and 12 
and fi.soft_deleted_flag = 'N'
group by  dio.row_key
order by dio.row_key asc

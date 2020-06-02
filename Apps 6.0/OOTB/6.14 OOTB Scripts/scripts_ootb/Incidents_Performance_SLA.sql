select di.caused_by_change_flag as "Caused by change", dio.organization_name  as "Name",
'' as  metric ,

--count(CASE WHEN dvm.dimension_wh_code = 'CLOSED' and di.met_sla_flag = 'Y' THEN 1 ELSE NULL end) as "met sla incidents",
--count(case when dvm.dimension_wh_code = 'CLOSED' then 1 else NULL end) as "Closed Incidents",
concat(round(cast(sum(CASE WHEN dvm.dimension_wh_code = 'CLOSED' and di.met_sla_flag = 'Y' THEN 1 ELSE NULL end)as numeric)/
cast(sum(case when dvm.dimension_wh_code = 'CLOSED' then 1 else NULL end)as numeric) *100 :: integer),'%') as "percentage met sla" ,
--sum(fi.open_to_close_duration) as "Open to close duration",
Sum(case when fi.open_to_close_duration is not Null then  fi.open_to_close_duration / 3600  else 0 end )as "Incident  opened to close",
case when count( case when  dvm.dimension_wh_code in('RESOLVED','CLOSED') then 1 end ) > 0 then
 round(
 cast(sum (case when dvm.dimension_wh_code = 'RESOLVED' or dvm.dimension_wh_code ='CLOSED' then COALESCE(open_to_resolve_duration,0) else 0 end /86400) as numeric )
 /
 cast(count(case when dvm.dimension_wh_code in('RESOLVED','CLOSED') then 1 end) as numeric) 
 ,1) 
else 0 end as "MTTR",
sum(case when di.multiple_assignment_flag = 'Y'then 1 else 0 end )as "Multiple assignment incident",
sum(case when di.multiple_assignment_flag = 'Y'and di.met_sla_flag = 'Y' then 1 else 0 end )as "Multiple assignment incidents met all sla",
sum(case when di.multiple_assignment_flag = 'Y'and di.met_sla_flag = 'N' then 1 else 0 end )as "Multiple assignment incidents missed any sla",
sum(case when di.over_due_flag ='Y' then 1 else 0 end )as "overdue incidents",
concat(round(cast(sum(case when di.over_due_flag ='Y' then 1 else 0 end )as numeric)/
cast(count(fi.row_key)as numeric)*100 ::integer),'%') as "overdue incidents percent",
sum(CASE WHEN di.reopened_flag ='Y' and di.met_sla_flag = 'Y' THEN 1 ELSE 0 end) as "Reopened incidents met all sla",
sum(Case when di.reopened_flag ='Y'and di.met_sla_flag = 'N'THEN 1 ELSE 0 end)as "Reopened incidents missed any sla "
from  #DWH_TABLE_SCHEMA.f_incident fi 
join #DWH_TABLE_SCHEMA.d_internal_contact dc
on  fi.opened_by_key = dc.row_key
join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key
join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on  fi.opened_on_key = dcd.row_key
 join #DWH_TABLE_SCHEMA.d_internal_organization dio 
on fi.opened_by_department_key = dio.row_key
join  #DWH_TABLE_SCHEMA.d_lov  dv 
on fi.state_src_key  = dv.row_key
join  #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
join #DWH_TABLE_SCHEMA.d_domain dom
on dom.row_key = fi.domain_key
where dcd.lagging_count_of_month between 0 and 12 
group by di.caused_by_change_flag,dio.organization_name
order by di.caused_by_change_flag,dio.organization_name asc;
select WK, 
organization_name, dimension_name,''as metric, 
coalesce(RFC_backlog,0) as RFC_backlog, 
RFC_pending_impl_changes,
concat((round(cast(RFC_pending_impl_changes as numeric) /RFC_backlog *100)):: integer 
,'%')  as percentage
-- concat(([RFC_pending_impl_changes] * 100 / [RFC_backlog]),'%' )as percentage
 from 
(select 
concat(wk.month_name_abbreviated::text, concat(' '::text, "substring"(wk.week_start_date_key::text, 7, 8))) WK, 
wk.week_id, wk.week_name, diogroup.organization_name, lovrisk.dimension_name,
count(case when dcr.backlog_flag='Y' then fcr.change_request_key else null end) as RFC_backlog,
sum(case when LM.dimension_wh_code in ('APPROVED') then 1 else 0 end ) as RFC_pending_impl_changes
from #DWH_TABLE_SCHEMA.f_change_request fcr
join #DWH_TABLE_SCHEMA.d_change_request dcr 
	  on dcr.row_key=fcr.change_request_key
	  and fcr.soft_deleted_flag <> 'Y'
join #DWH_TABLE_SCHEMA.d_calendar_date cal 
	  on (cal.row_key = fcr.opened_on_key)
join #DWH_TABLE_SCHEMA.d_calendar_date mon 
	  on (mon.row_key = cal.month_start_date_key
	  and mon.lagging_count_of_month between 0 and 12)
join #DWH_TABLE_SCHEMA.d_calendar_date wk 
	  on (wk.row_key = cal.week_start_date_key)
join  (	 SELECT dio.* FROM #DWH_TABLE_SCHEMA.d_internal_organization dio
  		 WHERE dio.group_flag = 'Y'::bpchar OR dio.row_key = 0 OR dio.row_key = -1
		) diogroup
	  on fcr.assignment_group_key = diogroup.row_key
join #DWH_TABLE_SCHEMA.d_lov lovstate
	  on fcr.state_src_key=lovstate.row_key
join #DWH_TABLE_SCHEMA.d_lov_map lovmapstate
	  on lovmapstate.src_key=lovstate.row_key
 join #DWH_TABLE_SCHEMA.d_lov L 
      on fcr.approval_state_src_key=L.row_key
 join #DWH_TABLE_SCHEMA.d_lov_map LM 
      on LM.src_key=L.row_key
 join (SELECT lov.* FROM #DWH_TABLE_SCHEMA.d_lov lov
  	  WHERE lov.dimension_class::text = 'RISK~CHANGE_REQUEST'::text OR lov.row_key = -1 OR lov.row_key = 0) lovrisk
  	  on lovrisk.row_key = fcr.risk_src_key
 join  ( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
  LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
     AND br.dimension_class::text = 'PRIORITY~CHANGE_REQUEST'::text
  UNION 
  SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0
  ) lov_pri
on fcr.priority_src_key=lov_pri.row_key
 

join  ( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
  LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
     AND br.dimension_class::text = 'TYPE~CHANGE_REQUEST'::text
  UNION 
  SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0
  ) lov_typ

on fcr.type_src_key=lov_typ.row_key
where lovmapstate.dimension_wh_code in ('OPEN')
--and LM.dimension_wh_code in ('APPROVED')
group by wk.week_id, wk.week_name, diogroup.organization_name, lovrisk.dimension_name
,wk.month_name_abbreviated,wk.week_start_date_key
order by wk.week_id, wk.week_name, UPPER(diogroup.organization_name), lovrisk.dimension_name);
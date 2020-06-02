select month_nm, organization_name, dimension_code, '' as metrics ,
opened_changes, unplanned_changes, planned_changes, rescheduled_changes
,concat(to_char(per_unplanned_changes_30days*100,'FM990.00'),'%') as per_unplanned_changes_30days,concat(to_char(per_rescheduled_changes_30days*100,'FM990.00'),'%') as per_rescheduled_changes_30days
from
(select cal.month_id, cal.month_name,concat(concat(cal.month_name_abbreviated, ' '), cal.year_id) month_nm
, dio.organization_name, lovcategory.dimension_code, 
count(fcr.change_request_key) as opened_changes, 
sum(case when dcr.unplanned_flag = 'Y' then 1 else 0 end ) as unplanned_changes,
sum(case when  cal.lagging_count_of_days between 0 and 29 and dcr.unplanned_flag = 'Y' then 1 else 0 end ) 
/sum(case when cal.lagging_count_of_days between 0 and 29 then 1 else null end)as per_unplanned_changes_30days,
sum(case when  dcr.unplanned_flag = 'N' then 1 else 0 end ) as planned_changes,
sum(case when dcr.rescheduled_flag = 'Y' then 1 else 0 end ) as rescheduled_changes
,sum(case when  cal.lagging_count_of_days between 0 and 29 and dcr.rescheduled_flag = 'Y' then 1 else 0 end ) 
/sum(case when cal.lagging_count_of_days between 0 and 29 then 1 else null end)as per_rescheduled_changes_30days

-- select fcr.row_id,dio.row_key
from #DWH_TABLE_SCHEMA.f_change_request fcr
join #DWH_TABLE_SCHEMA.d_change_request dcr 
	  on dcr.row_key=fcr.change_request_key
	  and fcr.soft_deleted_flag <> 'Y'
	  
join #DWH_TABLE_SCHEMA.d_calendar_date cal 
	  on (cal.row_key = fcr.opened_on_key
	  and cal.lagging_count_of_month between 0 and 12)
join #DWH_TABLE_SCHEMA.d_lov lovcategory
      on lovcategory.row_key = fcr.category_src_key
/*join #DWH_TABLE_SCHEMA.d_internal_contact dic
	  on dic.row_key = fcr.requested_by_key
	 
join  #DWH_TABLE_SCHEMA.d_internal_organization dio
	  on dic.department_key = dio.row_key*/ 
	

join  #DWH_TABLE_SCHEMA.d_internal_organization dio
	  on fcr.requested_by_department_key = dio.row_key	  
	  
	 
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
group by cal.month_id, cal.month_name, dio.organization_name, lovcategory.dimension_code,cal.month_name_abbreviated, cal.year_id
order by cal.month_id, cal.month_name, dio.organization_name, lovcategory.dimension_code,cal.month_name_abbreviated, cal.year_id);
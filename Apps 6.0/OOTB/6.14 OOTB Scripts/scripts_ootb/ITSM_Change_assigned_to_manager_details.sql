select full_name1 as assigned_to_manager ,full_name as assignee_name,-- , dimension_code
 '' as metrics ,
opened_changes-- , unplanned_changes, planned_changes, rescheduled_changes
from
(select dic.full_name as full_name1 , dio.full_name, -- lovcategory.dimension_code, 
count(fcr.change_request_key) as opened_changes/*, 
sum(case when dcr.unplanned_flag = 'Y' then 1 else 0 end ) as unplanned_changes,
sum(case when dcr.unplanned_flag = 'N' then 1 else 0 end ) as planned_changes,
sum(case when dcr.rescheduled_flag = 'Y' then 1 else 0 end ) as rescheduled_changes*/
from #DWH_TABLE_SCHEMA.f_change_request fcr
join #DWH_TABLE_SCHEMA.d_change_request dcr 
   on dcr.row_key=fcr.change_request_key
   and fcr.soft_deleted_flag <> 'Y'
join #DWH_TABLE_SCHEMA.d_calendar_date cal 
   on (cal.row_key = fcr.opened_on_key
   and cal.lagging_count_of_month between 0 and 12)
join #DWH_TABLE_SCHEMA.d_lov lovcategory
      on lovcategory.row_key = fcr.category_src_key
   
   
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

join #DWH_TABLE_SCHEMA.d_internal_contact dio
on dio.row_key =fcr.assigned_to_key

join #DWH_TABLE_SCHEMA.d_internal_contact dic
on dic.row_key =dio.manager_key

group by   dic.full_name,dio.full_name-- , lovcategory.dimension_code
order by  dic.full_name,dio.full_name-- , lovcategory.dimension_code
);


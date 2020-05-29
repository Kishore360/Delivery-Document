select lov_criticality.dimension_name as criticality, service.name, lov_usedfor.dimension_name, coalesce(service.version,'')  as version, ''as metrics,
count(fcr.change_request_key) as opened_changes, 
round(sum(coalesce(fcr.planned_duration::decimal(22,8),0))/86400,1) as planned_duration

from  #DWH_TABLE_SCHEMA.f_change_request fcr
join  #DWH_TABLE_SCHEMA.d_change_request dcr 
	  on dcr.row_key=fcr.change_request_key
	  and fcr.soft_deleted_flag <> 'Y'
join  #DWH_TABLE_SCHEMA.d_calendar_date cal 
	  on (cal.row_key = fcr.opened_on_key
	  and cal.lagging_count_of_month between 0 and 12)
join  #DWH_TABLE_SCHEMA.d_service service
	  on service.row_key = fcr.business_service_key
	  --and service.is_business_service_flag = 'Y'
join  
( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
   AND br.dimension_class::text = 'CRITICALITY~BUSINESS_SERVICE'::text
UNION 
 SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) lov_criticality
on service.criticality_key = lov_criticality.row_key
join  
( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
   AND br.dimension_class::text = 'USED_FOR~BUSINESS_SERVICE'::text
UNION 
 SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) lov_usedfor
on service.used_for_src_key = lov_usedfor.row_key

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
group by lov_criticality.dimension_name, service.name, lov_usedfor.dimension_name, service.version
order by lov_criticality.dimension_name, service.name, lov_usedfor.dimension_name, service.version


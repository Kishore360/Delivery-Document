select dcr.change_request_number, to_char(cast(cal.row_id as date),'mm/dd/yyyy') as date, 
dcr.backlog_flag, dcr.emergency_flag, dcr.failure_flag, dcr.met_sla_flag
, dcr.not_on_time_flag, dcr.rescheduled_flag, dcr.unplanned_flag,
dci.name, dcr.short_description, dcr.production_change_flag
, lov_type.dimension_name as reptype, location.location_name, 
dic.full_name as assignedto, dic1.full_name as employee, '' as metrics

, count(fcr.change_request_key) as OpenedChangesfrom 
-- select count(1)
from  #DWH_TABLE_SCHEMA.f_change_request fcr
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

join  
( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
   AND br.dimension_class::text = 'CONTACT_TYPE~CHANGE_REQUEST'::text
UNION 
 SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) lov_type
on fcr.reported_type_src_key =lov_type.ROW_KEY
join  #DWH_TABLE_SCHEMA.d_configuration_item dci
	  on fcr.configuration_item_key = dci.row_key
join  #DWH_TABLE_SCHEMA.d_internal_contact dic
	  on dic.row_key = fcr.assigned_to_key
join  #DWH_TABLE_SCHEMA.d_internal_contact dic1
	  on dic1.row_key = fcr.opened_by_key
	  join  ( SELECT a.* FROM  #DWH_TABLE_SCHEMA.d_location a
   LEFT JOIN  #DWH_TABLE_SCHEMA.d_geography b ON a.geo_key = b.row_key AND a.source_id = b.source_id) location
on fcr.location_key = location.row_key
	  -- filter the record with ß
	   where  trim(location.location_name) <> 'Bockenheimer Landstraße 123, Frankfurt'
	-- where dcr.change_request_number<>'CHG0001046'
group by dcr.change_request_number, cast(cal.row_id as date), dcr.backlog_flag, dcr.emergency_flag, dcr.failure_flag, dcr.met_sla_flag, dcr.not_on_time_flag,
dcr.rescheduled_flag, dcr.unplanned_flag, dci.name, dcr.short_description, dcr.production_change_flag, reptype, location.location_name,
assignedto, employee, fcr.change_request_key
order by dcr.change_request_number, cast(cal.row_id as date), dcr.backlog_flag, dcr.emergency_flag, dcr.failure_flag, dcr.met_sla_flag, dcr.not_on_time_flag, 
dcr.rescheduled_flag, dcr.unplanned_flag, dci.name, dcr.short_description, dcr.production_change_flag, reptype, location.location_name,
assignedto, employee, fcr.change_request_key;
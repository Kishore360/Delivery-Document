select dro.organization_name as "Assignment group" ,to_char(dcclsd.calendar_date , 'fmMM/fmDD/YYYY' ) as "Closed_calendar_date" , to_char( dcclsd.calendar_date  , 'fmMM/fmDD/YYYY')as "Closed" ,dcclsd.month_name as "Calendar Month"  , dcclsd.quarter_name as "closed_quarter",dcclsd.week_name as"Calendar_week" ,dcclsd.year_name as "closed_year" ,
 '' as metric , count(case when drst.wh_dimension_code = 'CLOSED' then fri.row_key end ) as "Closed Request Items" , 

 trim(to_char(Sum (COALESCE(fri.open_to_close_duration /86400,0)), '999,999,999,990')) as "Open to close duration"
from #DWH_TABLE_SCHEMA.f_request_item fri
 left join #DWH_TABLE_SCHEMA.d_request_item dri 
on fri.request_item_key = dri.row_key
left join ( SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~SC_REQ_ITEM'::text
UNION 
 SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS source_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS source_dimension_subtype, lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name, lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT'::character varying) AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT'::character varying) AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) drst
  on fri.state_src_key = drst.row_key
--join  #DWH_TABLE_SCHEMA.d_lov  dv 
--on fri.state_src_key  = dv.row_key
--join  #DWH_TABLE_SCHEMA.d_lov_map dvm
--on dvm.dimension_code  = dv.dimension_code
--and dvm.dimension_class=dv.dimension_class
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on fri.closed_on_key = dcd.row_key
left join #DWH_TABLE_SCHEMA.d_internal_organization dro
on dro.row_key = fri.assignment_group_key
left join (SELECT d_calendar_date.row_key, d_calendar_date.source_id, d_calendar_date.etl_run_number, d_calendar_date.calendar_code, d_calendar_date.calendar_name, d_calendar_date.calendar_date, d_calendar_date.day_of_week, d_calendar_date.day_of_month, d_calendar_date.day_of_quarter, d_calendar_date.day_of_year, d_calendar_date.week_day_flag, d_calendar_date.rolling_count_of_days, d_calendar_date.lagging_count_of_days, d_calendar_date.previous_day_key, 
        CASE
            WHEN d_calendar_date.previous_day_key IS NULL THEN NULL::timestamp without time zone
            ELSE prev_day.calendar_date
        END AS previous_day_date, d_calendar_date.week_id, d_calendar_date.week_name, d_calendar_date.day_name, d_calendar_date.week_start_date, d_calendar_date.week_end_date, d_calendar_date.week_start_date_key, d_calendar_date.week_end_date_key, d_calendar_date.week_number_of_year, d_calendar_date.rolling_count_of_weeks, d_calendar_date.lagging_count_of_weeks, d_calendar_date.previous_week_key, prev_week.week_name AS previous_week_name, d_calendar_date.previous_week_date, d_calendar_date.month_id, d_calendar_date.month_name, d_calendar_date.month_name_abbreviated, d_calendar_date.month_start_date, d_calendar_date.month_end_date, d_calendar_date.month_start_date_key, d_calendar_date.month_end_date_key, d_calendar_date.month_number_of_year, d_calendar_date.rolling_count_of_month, d_calendar_date.lagging_count_of_month, d_calendar_date.previous_month_key, prev_month.month_name AS previous_month_name, 
        CASE
            WHEN d_calendar_date.previous_month_key IS NULL THEN NULL::timestamp without time zone
            ELSE prev_month.calendar_date
        END AS previous_month_date, d_calendar_date.quarter_id, d_calendar_date.quarter_name, d_calendar_date.quarter_start_date, d_calendar_date.quarter_end_date, d_calendar_date.quarter_start_date_key, d_calendar_date.quarter_end_date_key, d_calendar_date.quarter_number_of_year, d_calendar_date.rolling_count_of_quarter, d_calendar_date.lagging_count_of_quarter, d_calendar_date.previous_quarter_key, prev_quarter.quarter_name AS previous_quarter_name, 
        CASE
            WHEN d_calendar_date.previous_quarter_key IS NULL THEN NULL::timestamp without time zone
            ELSE prev_quarter.calendar_date
        END AS previous_quarter_date, d_calendar_date.year_id, d_calendar_date.year_name, d_calendar_date.year_start_date, d_calendar_date.year_end_date, d_calendar_date.year_start_date_key, d_calendar_date.year_end_date_key, d_calendar_date.rolling_count_of_year, d_calendar_date.lagging_count_of_year, d_calendar_date.previous_year_key, prev_year.year_name AS previous_year_name, 
        CASE
            WHEN d_calendar_date.previous_year_key IS NULL THEN NULL::timestamp without time zone
            ELSE prev_year.calendar_date
        END AS previous_year_date, d_calendar_date.created_by, d_calendar_date.changed_by, d_calendar_date.created_on, d_calendar_date.changed_on, d_calendar_date.dw_inserted_on, d_calendar_date.dw_updated_on, d_calendar_date.week_number_of_month, d_calendar_date.week_number_of_quarter, d_calendar_date.week_start_date_of_quarter, d_calendar_date.week_end_date_of_quarter, d_calendar_date.week_start_date_of_quarter_key, d_calendar_date.week_end_date_of_quarter_key, d_calendar_date.week_start_date_of_month, d_calendar_date.week_end_date_of_month, d_calendar_date.week_start_date_of_month_key, d_calendar_date.week_end_date_of_month_key, d_calendar_date.same_day_last_year, d_calendar_date.same_week_last_year
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.period_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
where d_calendar_date.lagging_count_of_month between 0 and 12

) dcclsd

on dcclsd.row_key = fri.closed_on_key
where fri.soft_deleted_flag ='N'
and dcd.lagging_count_of_month between 0 and 12
group by dro.organization_name  ,dcclsd.calendar_date, dcclsd.month_name ,dcclsd.week_name, dcclsd.quarter_name, dcclsd.year_name
order by lower(dro.organization_name),lower(dcclsd.calendar_date),lower(dcclsd.month_name),lower(dcclsd.week_name),lower(dcclsd.quarter_name),lower(dcclsd.year_name) asc
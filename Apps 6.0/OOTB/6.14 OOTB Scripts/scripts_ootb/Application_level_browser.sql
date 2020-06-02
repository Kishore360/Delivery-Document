select app.name as app_name, app.type as application_type, app.version as application_version,
to_char(coalesce(sum(f.browser_page_visits),0),'9,999,999,990') as browser_page_visits, 
 trim(to_char(coalesce(((sum(f.satisfied_transaction_count) + 
 (sum(f.tolerating_transaction_count) * 0.5)) / NULLIF(sum(f.browser_page_visits), 0)),0), '9,999,999,990D99')) satisfaction_score, 
 trim(to_char(coalesce((sum(f.browser_page_load_time)/sum(f.browser_page_visits)),0), '9,999,999,990D99')) as key_tran_res_time,
 trim(to_char(coalesce((sum(f.network_time)/sum(f.browser_page_visits)),0), '9,999,999,990D99')) avg_ntwk_tm
,trim(to_char(coalesce((sum(f.page_rendering_time)/sum(f.browser_page_visits)),0), '9,999,999,990D99')) as avg_pg_rndr_tm
from #DWH_TABLE_SCHEMA.f_browser_application_summary f
join #DWH_TABLE_SCHEMA.d_browser d
    on  (f.browser_key = d.row_key)
join #DWH_TABLE_SCHEMA.d_application app
    on  (f.application_key = app.row_key)
join #DWH_TABLE_SCHEMA.d_transaction tran
on f.transaction_key = tran.row_key	
join (select loc.* from #DWH_TABLE_SCHEMA.d_location loc LEFT JOIN #DWH_TABLE_SCHEMA.d_geography geo
ON loc.geo_key = geo.row_key AND loc.source_id = geo.source_id )loc
on f.location_key = loc.row_key
join (select device_type.* from #DWH_TABLE_SCHEMA.d_lov device_type
  WHERE device_type.dimension_class::text = 'DEVICE_TYPE'::text OR device_type.row_key = 0 OR device_type.row_key = -1) lov
  on d.browser_device_type_key = lov.row_key
 join #DWH_TABLE_SCHEMA.d_calendar_date date
    on  (f.day_key = date.row_key)  
  join #DWH_TABLE_SCHEMA.d_calendar_time t
    on  (f.time_key = t.row_key) 
  join (select calendar_month.* from #DWH_TABLE_SCHEMA.d_calendar_date calendar_month
  WHERE calendar_month.row_key = calendar_month.month_start_date_key AND calendar_month.source_id = 0) mon
  on date.month_start_date_key = mon.row_key
  join (select calendar_week.* FROM #DWH_TABLE_SCHEMA.d_calendar_date calendar_week
  WHERE calendar_week.week_start_date_key = calendar_week.row_key AND calendar_week.source_id = 0) wk
  on date.week_start_date_key  = wk.row_key
  join (select calendar_time_hour.* FROM #DWH_TABLE_SCHEMA.d_calendar_time calendar_time_hour
  WHERE calendar_time_hour.minute_number = 0) time_hr
  on t.hour_key = time_hr.row_key
  where mon.lagging_count_of_month between 0 and 5
  group by 1, 2, 3
  order by app_name
 
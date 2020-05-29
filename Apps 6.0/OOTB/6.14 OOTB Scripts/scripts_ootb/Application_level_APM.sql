select application_name,application_type,application_version,
(case when app_tran_cnt=0 then null else trim(to_char(coalesce(((sat_tran_cnt + (tol_tran_cnt * 0.5)) / app_tran_cnt),0), '9,999,999,990D99'))end) as appdex_score,
(case when app_tran_cnt=0 then null else trim(to_char(coalesce((app_res_time/ app_tran_cnt),0), '9,999,999,990D99'))end) as app_res_time,
(case when app_tran_cnt=0 then null else trim(to_char(coalesce((db_res_tim/app_tran_cnt),0), '9,999,999,990D99'))end) as database_query_time,
(case when app_tran_cnt=0 then null else trim(to_char(coalesce(((1.00*errors/app_tran_cnt)*100),0), '9,999,999,990D99'))end) as app_err_rate, errors as errors_app_tier,
(case when app_tran_cnt=0 then null else trim(to_char(coalesce((app_key_tran_res_time/ app_tran_cnt),0), '9,999,999,990D99')) end) as key_tran_res_time


from
(select app.name as application_name, app.type as application_type, app.version as application_version,
count(f.application_transaction_count)as app_tran_cnt, 
sum(f.satisfied_transaction_count) sat_tran_cnt, 
sum(f.tolerating_transaction_count) tol_tran_cnt,
sum(f.application_response_time) app_res_time,
sum(f.errors_app_tier) as errors,
sum(f.database_response_time) db_res_tim,
sum(f.application_key_transaction_response_time) app_key_tran_res_time
from #DWH_TABLE_SCHEMA.f_application_summary f
left join #DWH_TABLE_SCHEMA.d_application d
  on  (f.application_key = d.row_key)
left join (select * from #DWH_TABLE_SCHEMA.d_application where source_id = 2) app
    on  (d.name = app.name)
join #DWH_TABLE_SCHEMA.d_transaction tran
on f.transaction_key = tran.row_key	
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
  group by 1,2,3
  order by application_name)
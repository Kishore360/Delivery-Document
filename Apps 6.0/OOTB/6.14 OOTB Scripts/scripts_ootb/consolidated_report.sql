select 'UNSPECIFIED' as application_name,TO_CHAR(f.calendar_date,'fmMM/fmDD/YYYY') as calendar_date,
concat(concat(f.month_name_abbreviated,' '),f.year_name) as calendar_month,
concat(concat(f.month_name_abbreviated,' '),(TO_CHAR(f.week_start_date,'DD')))as calendar_week,
f.location_name,

f.hour_1,
f.minute_number as time_1,f.name,
concat(trim(to_char(coalesce(round((case  when  count(availability) =0 then NULL
                                   when  count(availability) <>0
									then ( 100.00*(sum(case when availability='AVAILABLE' then 1 else 0 end )/count(availability))) end),1),0), '9,999,999,990D9')),'%') as availability,
									avg(f.average_response_time)
from (
select  f.application_key, dl.location_name ,dm.name,dt.minute_number, f.monitor_key, 
dc.calendar_date,dc.month_name_abbreviated,dc.month_id, dc.week_id , dc.year_name,dc.week_start_date,dt.hour_24_format_char as hour_1,
f.average_response_time,availability

from #DWH_TABLE_SCHEMA.f_synthetic f
 join  #DWH_TABLE_SCHEMA.d_monitor dm
 on dm.row_key=f.monitor_key
join #DWH_TABLE_SCHEMA.d_location dl
on f.location_key=dl.row_key
join #DWH_TABLE_SCHEMA.d_application da
on da.row_key=f.application_key
 join #DWH_TABLE_SCHEMA.d_calendar_time dt
 on dt.row_key=f.time_key

JOIN #DWH_TABLE_SCHEMA.D_CALENDaR_DATE dc
ON dc.row_key=f.day_key
    join #DWH_TABLE_SCHEMA.d_calendar_date cd
        on cd.row_key=dc.month_start_date_key
	

)f
group by application_name,f.calendar_date,f.month_id, calendar_month,f.week_id, calendar_week, f.location_name, f.name, f.hour_1, f.minute_number
order by application_name,f.calendar_date,f.month_id, calendar_month,f.week_id,calendar_week, lower(f.location_name), lower(f.name), lower(f.hour_1),f.minute_number;
select 'UNSPECIFIED' as application_name,
f.location_name,f.name,
concat(trim(to_char(coalesce(round((case  when  (count(*)) =0 then NULL
                                   when  (count(*)) <>0
				then ( 100.00*((sum(case when upper(coalesce(availability,''))='AVAILABLE' then 1 else 0 end )*1.0)/(count(*)))) end),1),0), '9,999,999,990D9')),'%') as availability
									,ROUND(SUM(f.average_response_time)/COUNT(*)) as average_response_time
from (
select 
 f.application_key, dl.location_name ,dm.name,f.average_response_time,availability,dm.row_key

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
)f
group by application_key,f.location_name,f.name
order by f.application_key,lower(f.location_name), upper(f.name);


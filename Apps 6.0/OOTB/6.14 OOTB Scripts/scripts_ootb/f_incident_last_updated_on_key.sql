SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_incident.last_updated_on_key' ELSE 'SUCCESS' END as Message
from
-- select src.incident_key,tgt.incident_key,coalesce(cal.row_key, 'a'),coalesce(tgt.last_updated_on_key,'a') from 
(select incident_key,source_id , max(changed_on) as changed_on_max
 from #DWH_TABLE_SCHEMA.f_incident
 where soft_deleted_flag='N'
 group by 1,2
 )
src
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(src.changed_on_max as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.f_incident tgt
on src.incident_key=tgt.incident_key
where coalesce(cal.row_key, 'a')<>coalesce(tgt.last_updated_on_key,'a')
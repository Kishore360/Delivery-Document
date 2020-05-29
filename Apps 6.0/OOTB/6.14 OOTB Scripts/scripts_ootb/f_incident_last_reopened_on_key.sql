SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_incident.last_reopened_on_key' ELSE 'SUCCESS' END as Message
from
-- select src.row_key,tgt.incident_key,coalesce(cal.row_key, 'a'),coalesce(tgt.last_reopened_on_key,'a')from 
(select * from #DWH_TABLE_SCHEMA.d_incident where soft_deleted_flag='N') src
left join #MDS_TABLE_SCHEMA.incident_final b
on src.row_id=b.sys_id
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on DATE_FORMAT(CONVERT_TZ(b.reopened_time,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d')=cal.calendar_date
left join #DWH_TABLE_SCHEMA.f_incident tgt
on src.row_key=tgt.incident_key
where coalesce(cal.row_key, 'a')<>coalesce(tgt.last_reopened_on_key,'a')
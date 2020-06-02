select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert_state.dimension_name' else 'Success' end as message2
from
(select distinct(alarmstate),sourceinstance  from #MDS_TABLE_SCHEMA.alarm_ext_final where cdctype <> 'D') src
left outer join #DWH_TABLE_SCHEMA.d_lov trgt
on trgt.row_id = CONCAT('STATE~ALARM~',src.alarmState)
  and trgt.source_id = src.sourceinstance
where coalesce(src.alarmstate,'') <> coalesce(trgt.dimension_name,'');





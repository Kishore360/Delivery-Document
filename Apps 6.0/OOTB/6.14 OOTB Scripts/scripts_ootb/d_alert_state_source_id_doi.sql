seselect  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert_state.source_id' else 'Success' end as message2
from
(select sourceinstance, alarmState  from #MDS_TABLE_SCHEMA.alarm_ext_final where alarmstate is not null) src
left outer join #DWH_TABLE_SCHEMA.d_lov trgt
on trgt.row_id = CONCAT('STATE~ALARM~',src.alarmState)
 and trgt.source_id = src.sourceinstance
where coalesce(src.sourceinstance,'') <> coalesce(trgt.source_id,'');
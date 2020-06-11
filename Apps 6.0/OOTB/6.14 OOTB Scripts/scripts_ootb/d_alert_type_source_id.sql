select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert_type.source_id' else 'Success' end as message2
from
(select distinct alarmType,sourceinstance from #MDS_TABLE_SCHEMA.alarm_ext_final where alarmtype is not null) src
left outer join #DWH_TABLE_SCHEMA.d_lov trgt
on trgt.row_id = CONCAT('TYPE~ALERT~',src.alarmType)
and trgt.source_id = src.sourceinstance
where coalesce(src.sourceinstance,'') <> coalesce(trgt.source_id,'');
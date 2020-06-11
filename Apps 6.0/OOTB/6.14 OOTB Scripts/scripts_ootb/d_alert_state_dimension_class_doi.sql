select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert_state.dimension_code' else 'Success' end as message2
from
(select distinct(alarmstate),sourceinstance ,'STATE~ALERT' from #MDS_TABLE_SCHEMA.alarm_ext_final where cdctype <> 'D' and alarmstate is not null) src
left outer join #DWH_TABLE_SCHEMA.d_lov trgt
on trgt.row_id = CONCAT('STATE~ALERT~',src.alarmState)
  and trgt.source_id = src.sourceinstance
where coalesce('STATE~ALERT','') <> coalesce(trgt.dimension_class,'');
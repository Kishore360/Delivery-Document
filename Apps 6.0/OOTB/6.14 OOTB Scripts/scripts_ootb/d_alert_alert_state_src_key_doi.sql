select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert.alert_STATE_SRC_KEY' else 'Success' end as message2
from
(select * from #MDS_TABLE_SCHEMA.alarm_ext_final where cdctype <> 'D') src2
left outer join #DWH_TABLE_SCHEMA.d_lov lkp
on lkp.row_id =COALESCE(CONCAT('STATE~ALERT~',src2.alarmState),'')
and lkp.source_id = src2.sourceinstance
left outer join #DWH_TABLE_SCHEMA.d_alert trgt
on src2.record_id = trgt.ROW_ID
and src2.sourceinstance = trgt.source_id
where coalesce(lkp.row_key,case when lkp.row_key is null then 0 else -1 end) <> coalesce(trgt.alert_STATE_SRC_KEY,'');













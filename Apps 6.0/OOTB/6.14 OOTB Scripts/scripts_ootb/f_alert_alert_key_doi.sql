select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for f_alert.Alert_key' else 'Success' end as message2
from
(select * from #MDS_TABLE_SCHEMA.alarm_final where cdctype <> 'D') src
left outer join #DWH_TABLE_SCHEMA.f_alert trgt
on src.__numerify__primary_key = trgt.ROW_ID
and src.sourceinstance = trgt.source_id
left outer join #DWH_TABLE_SCHEMA.d_alert lkp
on lkp.row_id = src.__numerify__primary_key
and lkp.source_id =src.sourceinstance
where coalesce(lkp.row_key,'') <> coalesce(trgt.ALERT_KEY,'');
select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert_type.row_id' else 'Success' end as message2
from
(select * from #MDS_TABLE_SCHEMA.alarm_ext_final where cdctype <> 'D') src
left outer join ca_doi_mdwdb.d_lov trgt
on trgt.row_id = CONCAT('TYPE~ALARM~',src.alarmType)
and trgt.source_id = src.sourceinstance
where coalesce(CONCAT('TYPE~ALARM~',src.alarmType),'') <> coalesce(trgt.row_id,'');
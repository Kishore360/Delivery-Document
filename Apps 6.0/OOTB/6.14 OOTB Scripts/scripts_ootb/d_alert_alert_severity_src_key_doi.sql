select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert.alert_severity_src_key' else 'Success' end as message2
from
(select * from #MDS_TABLE_SCHEMA.alarm_final where cdctype <> 'D') src
left outer join #DWH_TABLE_SCHEMA.d_lov lkp
on lkp.row_id =COALESCE(CONCAT('SEVERITY~ALERT~',src.severity),'UNSPECIFIED')
and lkp.source_id = src.sourceinstance
left outer join #DWH_TABLE_SCHEMA.d_alert trgt
on src.__numerify__primary_key = trgt.ROW_ID
and src.sourceinstance = trgt.source_id
where coalesce(lkp.row_key,case when lkp.row_key is null then 0 else -1 end) <> coalesce(trgt.alert_severity_src_key,'');
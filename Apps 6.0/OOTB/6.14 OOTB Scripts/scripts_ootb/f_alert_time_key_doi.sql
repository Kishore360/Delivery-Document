select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for f_alert.time_key' else 'Success' end as message2
from
(select * from #MDS_TABLE_SCHEMA.alarm_final where cdctype <> 'D') src
left JOIN #DWH_TABLE_SCHEMA.d_calendar_time LKP
ON LKP.row_id = date_format(CONVERT_TZ(TIMESTAMP,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%H%i')
left outer join #DWH_TABLE_SCHEMA.f_alert trgt
on src.__numerify__primary_key = trgt.ROW_ID
and src.sourceinstance = trgt.source_id
where COALESCE(LKP.row_key,case when LKP.row_key is null then 0 else -1 end) <> coalesce(trgt.time_key,'');
select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert.tenant' else 'Success' end as message2
from
(select * from #MDS_TABLE_SCHEMA.alarm_final where cdctype <> 'D') src
left outer join #DWH_TABLE_SCHEMA.d_alert trgt
on src.__numerify__primary_key = trgt.ROW_ID
and src.sourceinstance =trgt.source_id
where coalesce(src._tenant_id,'') <> coalesce(trgt.TENANT,'');



select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert.source_id' else 'Success' end as message2
from
(select * from #MDS_TABLE_SCHEMA.alarm_final where cdctype <> 'D' and alarm_data_type is not null) src
left outer join ca_doi_mdwdb.d_lov trgt
on trgt.source_id = CONCAT('CATEGORY~ALERT~',src.alarm_data_type)
 and trgt.source_id = src.sourceinstance
where coalesce(sourceinstance,'') <> coalesce(trgt.source_id,'');
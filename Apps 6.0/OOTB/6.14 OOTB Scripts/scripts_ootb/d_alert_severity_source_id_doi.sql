select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert_severity.source_id' else 'Success' end as message2
from 
(select  distinct(sourceinstance) as sourceinstance,severity from #MDS_TABLE_SCHEMA.alarm_final where cdctype <> 'D' and severity is not null) src
left outer join ca_doi_mdwdb.d_lov trgt
On trgt.row_id = CONCAT('SEVERITY~ALERT~',src.severity)
and src.sourceinstance=trgt.source_id
where coalesce(src.sourceinstance,'') <> coalesce(trgt.source_id,'');

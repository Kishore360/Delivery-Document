select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert_severity.dimension_code' else 'Success' end as message2
from 
(select  distinct(severity) as severity,sourceinstance from #MDS_TABLE_SCHEMA.alarm_final where cdctype <> 'D' and severity is not null) src
left outer join ca_doi_mdwdb.d_lov trgt
on concat('SEVERITY~ALERT~',src.severity)= trgt.row_id
and src.sourceinstance=trgt.source_id
where coalesce(src.severity,'') <> coalesce(trgt.dimension_code,'');



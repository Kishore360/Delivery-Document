select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert_category.dimension_code' else 'Success' end as message2
from 
(select  max(sourceinstance) as sourceinstance,severity from #MDS_TABLE_SCHEMA.alarm_final where cdctype <> 'D') src
left outer join #DWH_TABLE_SCHEMA.d_lov trgt
on trgt.row_id =CONCAT('SEVERITY~ALERT~',src.severity)
and src.sourceinstance=trgt.source_id
where coalesce(src.severity,'') <> coalesce(trgt.dimension_code,'');
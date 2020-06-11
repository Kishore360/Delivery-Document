select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert_category.dimension_name' else 'Success' end as message2
from 
(select  sourceinstance as sourceinstance,severity,max('SEVERITY~ALERT') from #MDS_TABLE_SCHEMA.alarm_final where cdctype <> 'D') src
left outer join #DWH_TABLE_SCHEMA.d_lov trgt
on trgt.row_id =CONCAT('SEVERITY~ALERT~',src.severity)
and src.sourceinstance=trgt.source_id
where coalesce('SEVERITY~ALERT','') <> coalesce(trgt.dimension_class,'');
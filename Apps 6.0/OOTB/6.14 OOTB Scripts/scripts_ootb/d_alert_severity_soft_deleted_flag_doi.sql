select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert_severity.soft_deleted_flag' else 'Success' end as message2
from 
(select distinct (case when cdctype = 'D' then 'Y' else 'N' end) as soft ,sourceinstance as sourceinstance,severity from #MDS_TABLE_SCHEMA.alarm_final ) src
left outer join #DWH_TABLE_SCHEMA.d_lov trgt
on trgt.row_id =CONCAT('SEVERITY~ALERT~',src.severity)
and src.sourceinstance=trgt.source_id
where coalesce(soft,'') <> coalesce(trgt.soft_deleted_flag,'');



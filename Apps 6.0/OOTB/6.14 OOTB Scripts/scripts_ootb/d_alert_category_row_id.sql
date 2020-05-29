select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_alert_category.dimension_code' else 'Success' end as message2
from 
(select distinct 'CATEGORY~ALERT' ,sourceinstance ,alarm_data_type from #MDS_TABLE_SCHEMA.alarm_final where cdctype <> 'D') src
left outer join #DWH_TABLE_SCHEMA.d_lov trgt
on trgt.row_id = CONCAT('CATEGORY~ALERT~',src.alarm_data_type)
and trgt.source_id = src.sourceinstance
where coalesce(CONCAT('CATEGORY~ALERT~',src.alarm_data_type),'') <> coalesce(trgt.row_id,'');
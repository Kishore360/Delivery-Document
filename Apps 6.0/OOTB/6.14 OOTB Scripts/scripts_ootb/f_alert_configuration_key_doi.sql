select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for f_alert.configuration_item_key' else 'Success' end as message2
from
(select * from #MDS_TABLE_SCHEMA.alarm_ext_final where cdctype <> 'D') src1
left join #DWH_TABLE_SCHEMA.d_configuration_item lkp
on lkp.name = src1.ci_name
and lkp.source_id = src1.sourceinstance
left outer join #DWH_TABLE_SCHEMA.f_alert trgt
on src1.record_id = trgt.ROW_ID
and src1.sourceinstance = trgt.source_id
where coalesce(lkp.row_key,case when src1.ci_name IS NULL THEN 0 else '-1' end,'') <> coalesce(trgt.configuration_item_key,'');




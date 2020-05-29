select  case when count(1)>0 then 'Failure' else 'Success' end as message1 ,
case when count(1)>0 then 'MDS to MDW data validation  failed  for d_configuration_item.name' else 'Success' end as message2
from
(select distinct ci_name ,record_id ,sourceinstance from #MDS_TABLE_SCHEMA.alarm_ext_final where cdctype <> 'D') src
left outer join #DWH_TABLE_SCHEMA.d_configuration_item trgt
on src.record_id = trgt.ROW_ID
and src.sourceinstance = trgt.source_id
where coalesce(src.ci_name,'') <> coalesce(trgt.name,'');




		


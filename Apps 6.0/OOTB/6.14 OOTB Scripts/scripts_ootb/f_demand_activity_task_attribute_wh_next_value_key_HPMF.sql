SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.task_attribute_wh_next_value_key' ELSE 'SUCCESS' END as Message
from (select TRGT.task_attribute_wh_next_value_key 
from #DWH_TABLE_SCHEMA.f_demand_activity TRGT
join #DWH_TABLE_SCHEMA.f_demand_activity TRGT_NXT
on TRGT.primary_sequence_id+1=TRGT_NXT.primary_sequence_id
and TRGT.demand_key=TRGT_NXT.demand_key
and TRGT.task_attribute_wh_name=TRGT_NXT.task_attribute_wh_name
where coalesce(TRGT_NXT.task_attribute_wh_new_value_key,'')<>coalesce(TRGT.task_attribute_wh_next_value_key,'')
union
select TRGT2.task_attribute_wh_next_value_key from #DWH_TABLE_SCHEMA.f_demand_activity TRGT2
 join
(select max(primary_sequence_id) as max_primary_sequence_id,demand_key,task_attribute_wh_name
 from #DWH_TABLE_SCHEMA.f_demand_activity
 group by demand_key,task_attribute_wh_name)TRGT1

on TRGT1.demand_key=TRGT2.demand_key
and TRGT1.task_attribute_wh_name=TRGT2.task_attribute_wh_name
and TRGT1.max_primary_sequence_id=TRGT2.primary_sequence_id
where TRGT2.task_attribute_wh_next_value_key<>0)a;
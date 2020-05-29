SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.task_attribute_wh_next_value' ELSE 'SUCCESS' END as Message
from (select TRGT.task_attribute_wh_next_value 
from #DWH_TABLE_SCHEMA.f_demand_activity TRGT
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT_NXT
on TRGT.primary_sequence_id+1=TRGT_NXT.primary_sequence_id
and TRGT.demand_key=TRGT_NXT.demand_key
and TRGT.task_attribute_wh_name=TRGT_NXT.task_attribute_wh_name
where (TRGT.task_attribute_wh_next_value is not null) and 
coalesce(TRGT_NXT.task_attribute_wh_new_value,'')<>coalesce(TRGT.task_attribute_wh_next_value,'')
union
select TRGT2.task_attribute_wh_next_value from #DWH_TABLE_SCHEMA.f_demand_activity TRGT2
left join
(select max(primary_sequence_id) as max_primary_sequence_id,demand_key,task_attribute_wh_name
 from #DWH_TABLE_SCHEMA.f_demand_activity
 group by demand_key,task_attribute_wh_name)TRGT1

on TRGT1.demand_key=TRGT2.demand_key
and TRGT1.task_attribute_wh_name=TRGT2.task_attribute_wh_name
and TRGT1.max_primary_sequence_id=TRGT2.primary_sequence_id
where TRGT2.task_attribute_wh_next_value is not null)a;
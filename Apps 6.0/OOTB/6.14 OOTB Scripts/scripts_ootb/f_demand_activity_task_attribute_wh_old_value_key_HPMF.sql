SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.task_attribute_wh_old_value_key' ELSE 'SUCCESS' END as Message
from (select coalesce(TRGT.task_attribute_wh_old_value_key,0)
from (select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_lov lov
on lov.row_id=concat('DEMAND~',TRGT.task_attribute_wh_name,'~',SRC.OLD_COLUMN_VALUE)
and lov.source_id=SRC.sourceinstance
where TRGT.primary_sequence_id<>0
and coalesce(lov.row_key,case when SRC.OLD_COLUMN_VALUE is null then 0 else -1 end)
<>coalesce(TRGT.task_attribute_wh_old_value_key,0)
UNION 
select TRGT1.task_attribute_wh_old_value_key from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1
left join #DWH_TABLE_SCHEMA.d_demand d_dem
on TRGT1.demand_key=d_dem.row_key
where TRGT1.primary_sequence_id=0 and 
coalesce(TRGT1.task_attribute_wh_old_value_key)<>0)a;
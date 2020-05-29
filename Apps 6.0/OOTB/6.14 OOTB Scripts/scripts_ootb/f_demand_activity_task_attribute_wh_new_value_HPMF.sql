SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.task_attribute_wh_new_value' ELSE 'SUCCESS' END as Message
from (select coalesce(SRC.NEW_COLUMN_VALUE,''),coalesce(TRGT.task_attribute_wh_new_value,'') 
from (select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.primary_sequence_id<>0 
and coalesce(SRC.NEW_COLUMN_VALUE,'')<>coalesce(TRGT.task_attribute_wh_new_value,'')
UNION 
select coalesce(TRGT1.task_attribute_wh_new_value),null from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT_NXT
on TRGT1.demand_key=TRGT_NXT.demand_key
and TRGT1.source_id=TRGT_NXT.source_id 
and TRGT1.task_attribute_wh_name=TRGT_NXT.task_attribute_wh_name
and TRGT_NXT.primary_sequence_id=1
left join #DWH_TABLE_SCHEMA.d_demand d_dem
on TRGT1.demand_key=d_dem.row_key
left join #DWH_TABLE_SCHEMA.d_lov d_map
on d_dem.demand_status_src_key=d_map.row_key
left join #DWH_TABLE_SCHEMA.d_lov d_map1
on d_dem.demand_project_status_src_key=d_map1.row_key
where TRGT1.primary_sequence_id=0 and 
d_dem.soft_deleted_flag = 'N'
and COALESCE(TRGT1.task_attribute_wh_new_value) is not null
/*coalesce(coalesce(TRGT_NXT.task_attribute_wh_old_value, case when upper(TRGT1.task_attribute_wh_name) ='STATUS' then (d_map.dimension_code) else (d_map1.dimension_code)end),'')<>coalesce(TRGT1.task_attribute_wh_new_value,'')*/
)a;
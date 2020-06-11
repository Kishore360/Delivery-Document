SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.demand_status_approver_key' ELSE 'SUCCESS' END as Message
from (select 
coalesce(TRGT.demand_status_approver_key,'') from(select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_internal_contact d_int
on d_int.row_id=concat('INTERNAL_CONTACT~',SRC.last_updated_by)
where TRGT.primary_sequence_id<>0 and d_int.source_id=TRGT.source_id and
coalesce(d_int.row_key,case when SRC.last_updated_by is null then 0 else -1 end)<>coalesce(TRGT.demand_status_approver_key,'')
UNION 
select coalesce(TRGT1.demand_status_approver_key) from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1
left join #DWH_TABLE_SCHEMA.d_demand d_dem
on TRGT1.demand_key=d_dem.row_key
where TRGT1.primary_sequence_id=0 and TRGT1.source_id=d_dem.source_id and
coalesce(TRGT1.demand_status_approver_key) is not null)a;
-- coalesce(concat(d_dem.row_id,'~',TRGT1.task_attribute_wh_name),'')<>coalesce(TRGT1.demand_status_approver_key,''))a;
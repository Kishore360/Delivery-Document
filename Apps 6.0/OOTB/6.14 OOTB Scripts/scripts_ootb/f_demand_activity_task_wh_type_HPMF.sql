SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.task_wh_type' ELSE 'SUCCESS' END as Message
from (select coalesce(SRC.TABLE_NAME,''),coalesce(TRGT.task_wh_type,'') from 
(select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.primary_sequence_id<>0
and coalesce(SRC.TABLE_NAME,'')<>coalesce(TRGT.task_wh_type,'')
UNION 
select coalesce(TRGT1.task_wh_type,''),'kcrt_requests'
from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1
left join #DWH_TABLE_SCHEMA.d_demand d_dem
on TRGT1.demand_key=d_dem.row_key
where TRGT1.primary_sequence_id=0 and 
coalesce(TRGT1.task_wh_type,'')<>'kcrt_requests')a;
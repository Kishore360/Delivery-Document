SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.changed_by' ELSE 'SUCCESS' END as Message
from (select coalesce(SRC.LAST_UPDATED_BY,''),coalesce(TRGT.changed_by,'') 
from (select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.primary_sequence_id<>0 
and coalesce(SRC.LAST_UPDATED_BY,'')<>coalesce(TRGT.changed_by,'')
UNION 
select coalesce(TRGT1.changed_by),null from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1 
where TRGT1.primary_sequence_id=0 and (TRGT1.changed_by) is not null
)a;
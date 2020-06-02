SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.created_by' ELSE 'SUCCESS' END as Message
from (select coalesce(SRC.created_by,''),coalesce(TRGT.created_by,'') from
(select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.primary_sequence_id<>0
and coalesce(SRC.created_by,'')<>coalesce(TRGT.created_by,'')
UNION 
select coalesce(d_dem.created_by,''),coalesce(TRGT.created_by,'') from #DWH_TABLE_SCHEMA.f_demand_activity TRGT
left join #DWH_TABLE_SCHEMA.d_demand d_dem
on TRGT.demand_key=d_dem.row_key
where TRGT.primary_sequence_id=0 and 
coalesce(d_dem.created_by,'')<>coalesce(TRGT.created_by,''))a;
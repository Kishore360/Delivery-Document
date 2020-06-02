SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.soft_deleted_flag' ELSE 'SUCCESS' END as Message
from(select TRGT.soft_deleted_flag from(select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.primary_sequence_id<>0
and coalesce(case when SRC.cdctype='D' then 'Y' else 'N' end,'')<>coalesce(TRGT.soft_deleted_flag,'')
UNION 
select TRGT1.soft_deleted_flag from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1
left join #DWH_TABLE_SCHEMA.d_demand d_dem
on TRGT1.demand_key=d_dem.row_key
where TRGT1.primary_sequence_id=0 and 
coalesce(d_dem.soft_deleted_flag,'')<>coalesce(TRGT1.soft_deleted_flag,''))a;
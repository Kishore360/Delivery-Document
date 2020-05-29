SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.created_on' ELSE 'SUCCESS' END as Message
from(select coalesce(TRGT.created_on,'')
from (select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.primary_sequence_id<>0
and coalesce(convert_tz(SRC.creation_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.created_on,'')
UNION 
select coalesce(TRGT.created_on,0) from #DWH_TABLE_SCHEMA.f_demand_activity TRGT
left join #DWH_TABLE_SCHEMA.d_demand d_dem
on TRGT.demand_key=d_dem.row_key
where TRGT.primary_sequence_id=0 and  d_dem.source_id<>TRGT.source_id and 
coalesce(d_dem.created_on,0)<>coalesce(TRGT.created_on,1))a;
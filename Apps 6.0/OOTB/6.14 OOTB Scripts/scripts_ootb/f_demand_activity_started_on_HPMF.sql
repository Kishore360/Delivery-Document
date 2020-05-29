SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.started_on' ELSE 'SUCCESS' END as Message
from (select TRGT.started_on from (select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.primary_sequence_id<>0
and coalesce(convert_tz(SRC.creation_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.started_on,'')
UNION 
select TRGT1.started_on from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1
left join #DWH_TABLE_SCHEMA.d_demand d_dem
on TRGT1.demand_key=d_dem.row_key
where TRGT1.primary_sequence_id=0 and 
coalesce(TRGT1.started_on) is not null
/*coalesce(d_dem.created_on,'')<>coalesce(TRGT1.started_on,'')*/

)a;
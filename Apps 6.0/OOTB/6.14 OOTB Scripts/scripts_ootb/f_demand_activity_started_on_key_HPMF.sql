SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.started_on_key' ELSE 'SUCCESS' END as Message
from (select coalesce(date_format(convert_tz(SRC.creation_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),''),
coalesce(TRGT.started_on_key,'')
 from (select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.primary_sequence_id<>0
and coalesce(date_format(convert_tz(SRC.creation_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),'')
<>coalesce(TRGT.started_on_key,'')
UNION 
select TRGT1.started_on_key,null from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1
left join #DWH_TABLE_SCHEMA.d_demand d_dem
on TRGT1.demand_key=d_dem.row_key
where TRGT1.primary_sequence_id=0 and TRGT1.started_on_key is not null
/*coalesce(date_format(d_dem.created_on,'%Y%m%d'),'')<>coalesce(TRGT1.started_on_key,'')*/
)a;
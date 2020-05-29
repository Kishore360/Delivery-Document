SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.changed_on' ELSE 'SUCCESS' END as Message
from (select coalesce(convert_tz(SRC.LAST_UPDATE_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),coalesce(TRGT.changed_on,'') 
from (select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.primary_sequence_id<>0 
and coalesce(convert_tz(SRC.LAST_UPDATE_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.changed_on,'')
UNION 
select coalesce(TRGT1.changed_on),null from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1 
where TRGT1.primary_sequence_id=0 and (TRGT1.changed_on) is not null
)a;
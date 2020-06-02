SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.created_time_key' ELSE 'SUCCESS' END as Message
from(select date_format(convert_tz(SRC.creation_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%H%i'),
TRGT.created_time_key from(select * from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_demand_activity TRGT
on SRC.transaction_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_calendar_time d_cal
on d_cal.row_id=date_format(convert_tz(SRC.creation_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%H%i')
where TRGT.primary_sequence_id<>0
and coalesce(d_cal.row_key,case when SRC.creation_date is null then 0 else -1 end)<>coalesce(TRGT.created_time_key,'')
UNION 
select coalesce(d_cal.row_key,''),TRGT1.created_time_key from #DWH_TABLE_SCHEMA.f_demand_activity TRGT1
left join #DWH_TABLE_SCHEMA.d_demand d_dem
on TRGT1.demand_key=d_dem.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_time d_cal
on d_cal.row_id=date_format(d_dem.created_on,'%H%i') 
where TRGT1.primary_sequence_id=0 and d_dem.source_id<>TRGT1.source_id and
coalesce(d_cal.row_key,'')<>coalesce(TRGT1.created_time_key,''))a;
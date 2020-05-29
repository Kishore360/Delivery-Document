SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for  f_build_run.build_END_TIME_KEY' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.build_final SRC
left join #DWH_TABLE_SCHEMA.f_build_run TRG
on   SRC.__numerify__primary_key=TRG.ROW_ID
and SRC.sourceinstance=TRG.source_id
left outer join #DWH_TABLE_SCHEMA.d_calendar_time lkp
on lkp.row_id = DATE_FORMAT(TIMESTAMPADD(SECOND, SRC.duration/1000, CONVERT_TZ(FROM_UNIXTIME(SRC.timestamp /1000),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') ), '%H%i')
WHERE COALESCE(lkp.row_key, case when SRC.timestamp is null then 0 else -1 end)<> COALESCE(TRG.build_END_TIME_KEY,'');
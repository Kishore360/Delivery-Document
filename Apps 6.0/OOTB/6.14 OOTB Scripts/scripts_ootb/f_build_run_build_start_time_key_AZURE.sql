SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for  f_build_run.build_start_time_key' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.azure_build_final SRC
left join #DWH_TABLE_SCHEMA. f_build_run TRG
on   SRC.__numerify__primary_key=TRG.ROW_ID
and SRC.sourceinstance=TRG.source_id
left outer join #DWH_TABLE_SCHEMA.d_calendar_time lkp
on lkp.row_id = coalesce(DATE_FORMAT(CONVERT_TZ(SRC.startTime,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%H%i'), 'UNSPECIFIED')
WHERE COALESCE(lkp.row_key, case when SRC.startTime is null then 0 else -1 end)<> COALESCE(TRG.build_start_time_key
,'');


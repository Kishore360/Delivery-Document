SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for  f_build_run.build_end_on_key' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.azure_build_final SRC
left join #DWH_TABLE_SCHEMA.f_build_run TRG
on   SRC.__numerify__primary_key=TRG.ROW_ID
and SRC.sourceinstance=TRG.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on LKP.row_id = DATE_FORMAT(CONVERT_TZ(SRC.finishTime,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d')
WHERE COALESCE(LKP.row_key, case when SRC.finishTime is null then 0 else -1 end)<> COALESCE(TRG.build_end_on_key,'');


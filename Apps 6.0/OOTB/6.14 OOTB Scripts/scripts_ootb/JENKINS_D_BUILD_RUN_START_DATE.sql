SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_run.start_time' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.build_final SRC
left join #DWH_TABLE_SCHEMA.d_build_run TRG
on  (SRC.__numerify__primary_key=TRG.row_id
and SRC.sourceinstance=TRG.source_id)
WHERE COALESCE(date_format(CONVERT_TZ(FROM_UNIXTIME(round(((SRC.timestamp+SRC.duration)/1000))),
'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y-%m-%d %H:%i:%s'),0) <> COALESCE(TRG.end_time,'');
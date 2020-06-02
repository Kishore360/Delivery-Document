SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for  f_build_run.changed_on	' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.azure_build_final SRC
left join #DWH_TABLE_SCHEMA. f_build_run TRG
on   SRC.__numerify__primary_key=TRG.row_id and SRC.sourceinstance=TRG.source_id
WHERE COALESCE(convert_tz(SRC.lastChangedDate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> COALESCE(TRG.changed_on,'');
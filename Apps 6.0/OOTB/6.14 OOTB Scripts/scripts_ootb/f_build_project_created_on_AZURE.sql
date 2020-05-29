SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_build_project.created_on' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.azure_build_definition_final SRC
left join #DWH_TABLE_SCHEMA.f_build_project TRG
on  SRC.__numerify__primary_key=TRG.row_id
and SRC.sourceinstance=TRG.source_id
WHERE COALESCE(CONVERT_TZ(SRC.createdDate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> COALESCE(TRG.created_on,'');


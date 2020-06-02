SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_project.changed_by' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.azure_build_definition_final SRC
left join #DWH_TABLE_SCHEMA.d_build_project TRG
on  SRC.__numerify__primary_key=TRG.row_id
and SRC.sourceinstance=TRG.source_id
where COALESCE(TRG.changed_by,'') <> COALESCE(NULL,'')
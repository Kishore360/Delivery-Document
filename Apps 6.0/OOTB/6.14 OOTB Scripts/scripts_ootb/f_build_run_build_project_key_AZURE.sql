SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for  f_build_run.build_PROJECT_KEY' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.azure_build_final SRC
left join #DWH_TABLE_SCHEMA.f_build_run TRG
on   SRC.__numerify__primary_key=TRG.row_id and SRC.sourceinstance=TRG.source_id
left join #DWH_TABLE_SCHEMA.d_build_project project
on SRC.definitionKey=project.row_id and SRC.sourceinstance=project.source_id
WHERE COALESCE(project.row_key, case when SRC.definitionKey is null then 0 else -1  end)  <> COALESCE(TRG.build_project_key,'');
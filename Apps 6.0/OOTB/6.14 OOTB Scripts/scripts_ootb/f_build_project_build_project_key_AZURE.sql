SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_build_project.build_project_key' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.azure_build_definition_final SRC
left join #DWH_TABLE_SCHEMA.f_build_project TRG
on  (concat(SRC.__numerify__primary_key,'')=TRG.row_id
and SRC.sourceinstance=TRG.source_id)
left join #DWH_TABLE_SCHEMA.d_build_project LKP
on  (concat(SRC.__numerify__primary_key,'') = LKP.row_id and SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,'')<> COALESCE(TRG.build_project_key,'');

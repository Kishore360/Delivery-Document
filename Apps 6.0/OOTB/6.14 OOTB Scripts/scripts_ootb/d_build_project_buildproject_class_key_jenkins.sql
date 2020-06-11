SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_project.buildproject_class_key' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.job_final SRC
left join #DWH_TABLE_SCHEMA.d_build_project TRG
on  SRC.__numerify__primary_key=TRG.row_id
and SRC.sourceinstance=TRG.source_id 
left join #DWH_TABLE_SCHEMA.d_lov LM
on (LM.row_id =CONCAT('BUILDPROJECT~CLASS~',SRC._class)and SRC.sourceinstance = LM.source_id )
WHERE COALESCE(LM.row_key,CASE WHEN SRC._class IS NULL THEN 0 else -1 end)<> COALESCE(TRG.buildproject_class_key,'');




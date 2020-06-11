SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for  f_build_run.build_PROJECT_KEY' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.build_final SRC
left join #DWH_TABLE_SCHEMA.d_build_project project
on SRC.__numerify__parent_key=project.row_id
and SRC.sourceinstance=project.source_id
left join #DWH_TABLE_SCHEMA.f_build_run TRG
on   SRC.__numerify__primary_key=TRG.ROW_ID
and SRC.sourceinstance=TRG.source_id

WHERE case when project.ROW_KEY is not null then project.ROW_KEY 
when SRC.__numerify__primary_key is not null then -1 else 0  end
<> COALESCE(TRG.build_project_key,'');
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_project.created_on' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.job_final SRC
left join #DWH_TABLE_SCHEMA.d_build_project TRG
on  SRC.__numerify__primary_key=TRG.row_id
and SRC.sourceinstance=TRG.source_id
WHERE TRG.ROW_KEY NOT IN (0,-1) AND TRG.CREATED_ON is not NULL;
-- WHERE COALESCE(SRC.row_id,'')<> COALESCE(TRG.created_on,'');
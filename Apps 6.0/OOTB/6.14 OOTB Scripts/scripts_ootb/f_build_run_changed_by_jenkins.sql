SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for  f_build_run.CHANGED_BY' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.build_final SRC
left join #DWH_TABLE_SCHEMA.f_build_run TRG
on   SRC.__numerify__primary_key=TRG.ROW_ID
and SRC.sourceinstance=TRG.source_id
WHERE TRG.ROW_KEY NOT IN (0,-1) AND TRG.CHANGED_BY is not NULL;
-- WHERE COALESCE(SRC.Creatorid,'')<> COALESCE(TRG.CHANGED_BY,'');
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for D_BUILD_RUN.CREATED_BY' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.build_final SRC
left join #DWH_TABLE_SCHEMA.d_build_run TRG
on  (SRC.__numerify__primary_key=TRG.row_id
and SRC.sourceinstance=TRG.source_id)
WHERE TRG.ROW_KEY NOT IN (0,-1) AND TRG.CREATED_BY is not NULL;

-- WHERE COALESCE(SRC.Creator,'')<> COALESCE(TRG.CREATED_BY,'');

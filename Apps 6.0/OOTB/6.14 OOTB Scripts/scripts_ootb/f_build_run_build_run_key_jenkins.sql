SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for  f_build_run.build_RUN_KEY' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.build_final SRC
left join #DWH_TABLE_SCHEMA.d_build_run run
on SRC.__numerify__primary_key=run.ROW_ID
and SRC.sourceinstance=run.source_id
left join #DWH_TABLE_SCHEMA.f_build_run TRG
on   SRC.__numerify__primary_key=TRG.ROW_ID
and SRC.sourceinstance=TRG.source_id

WHERE COALESCE(run.ROW_KEY,'')<> COALESCE(TRG.build_RUN_KEY,'');
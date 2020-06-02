SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_run.build_state_src_key' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.build_final SRC
left join #DWH_TABLE_SCHEMA.d_build_run TRG
on  (SRC.__numerify__primary_key=TRG.row_id
and SRC.sourceinstance=TRG.source_id)
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on (LM.src_rowid = CONCAT('STATE~BUILD~',SRC.result) AND SRC.sourceinstance = LM.source_id )
WHERE COALESCE(LM.src_key,CASE WHEN SRC.result IS NULL THEN 0 else -1 end)<> COALESCE(TRG.build_state_src_key,'');
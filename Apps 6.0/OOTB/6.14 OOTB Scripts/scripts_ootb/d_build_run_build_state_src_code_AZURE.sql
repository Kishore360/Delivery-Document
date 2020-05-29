SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_run.build_state_src_code' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.azure_build_final SRC
left join #DWH_TABLE_SCHEMA.d_build_run TRG
on  (SRC.__numerify__primary_key=TRG.row_id
and SRC.sourceinstance=TRG.source_id)
WHERE COALESCE(SRC.status,'')<> COALESCE(TRG.build_state_src_code,'');
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_project.laststablebuild' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.job_final SRC
left join #DWH_TABLE_SCHEMA.d_build_project TRG
on  SRC.__numerify__primary_key=TRG.row_id
and SRC.sourceinstance=TRG.source_id
left join #DWH_TABLE_SCHEMA.d_build_run run
on run.row_id=SRC.laststablebuild 
and SRC.sourceinstance=run.source_id
WHERE COALESCE(run.row_key,CASE WHEN SRC.laststablebuild IS NULL THEN 0 else -1 end)<> COALESCE(TRG.last_stable_build_run_key,''); 
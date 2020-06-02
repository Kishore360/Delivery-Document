SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_run.build_running_flag' ELSE 'SUCCESS' END as Message
/* select sts.dimension_wh_code,rslt.dimension_wh_code,starTtime,finishTime,result,status,
 COALESCE(case when sts.dimension_wh_code = 'IN PROGRESS' or rslt.dimension_wh_code = 'IN PROGRESS' then 'Y' else 'N' end,'N'), COALESCE(TRG.build_running_flag,'')*/
from #MDS_TABLE_SCHEMA.azure_build_final SRC
left join #DWH_TABLE_SCHEMA.d_build_run TRG
on  (SRC.__numerify__primary_key=TRG.row_id
and SRC.sourceinstance=TRG.source_id)
left join #DWH_TABLE_SCHEMA.d_lov_map sts
on concat('STATE~BUILD~',SRC.status) = sts.src_rowid and SRC.sourceinstance=sts.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map rslt
on concat('RESULT~BUILD~',SRC.result) = rslt.src_rowid and SRC.sourceinstance=rslt.source_id
WHERE COALESCE(case when sts.dimension_wh_code = 'IN PROGRESS' or rslt.dimension_wh_code = 'IN PROGRESS' then 'Y' else 'N' end,'N')<> COALESCE(TRG.build_running_flag,'');
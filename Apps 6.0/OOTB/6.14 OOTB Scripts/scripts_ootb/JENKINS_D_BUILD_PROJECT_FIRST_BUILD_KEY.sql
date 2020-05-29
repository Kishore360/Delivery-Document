SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_build_project.first_build_run_key' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.job_final SRC
left join #DWH_TABLE_SCHEMA.d_build_project TRG
on  SRC.__numerify__primary_key=TRG.row_id
and SRC.sourceinstance=TRG.source_id
left join #DWH_TABLE_SCHEMA.d_build_run lkp
on  SRC.firstbuild=lkp.row_id
and SRC.sourceinstance=TRG.source_id
WHERE COALESCE(case when lkp.row_key is null then 0 else lkp.row_key end)<> COALESCE(TRG.first_build_run_key,'');




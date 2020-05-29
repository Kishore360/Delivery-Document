SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for  f_build_run.automated_test_fail_count' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.azure_build_final build
left join  #DWH_TABLE_SCHEMA.f_build_run TRG
on build.__numerify__primary_key=TRG.row_id and build.sourceinstance=TRG.source_id
WHERE COALESCE(TRG.automated_test_fail_count,'') <> 0

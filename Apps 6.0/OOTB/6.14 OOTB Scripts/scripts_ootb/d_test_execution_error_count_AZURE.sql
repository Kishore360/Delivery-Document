-- as of now this column is not populated for azure devops

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH validation failed for d_test_execution.error_count' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.azure_test_run_final  where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_test_execution TRGT
on SRC.__numerify__primary_key=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(null, 0) <>coalesce(TRGT.error_count,'');
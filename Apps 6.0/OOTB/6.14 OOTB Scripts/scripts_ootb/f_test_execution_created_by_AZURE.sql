SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH validation failed for f_test_execution.created_by' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.azure_test_result_final  where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.f_test_execution TRGT
on concat(SRC.__numerify__primary_key,'')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.runByKey, '')<>coalesce(TRGT.created_by,'');
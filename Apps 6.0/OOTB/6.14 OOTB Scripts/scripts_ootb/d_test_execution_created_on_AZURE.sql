SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH validation failed for d_test_execution.created_on' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.azure_test_run_final  where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_test_execution TRGT
on concat(SRC.__numerify__primary_key,'')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where COALESCE(convert_tz(SRC.createdDate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')
<>coalesce(TRGT.created_on,'');
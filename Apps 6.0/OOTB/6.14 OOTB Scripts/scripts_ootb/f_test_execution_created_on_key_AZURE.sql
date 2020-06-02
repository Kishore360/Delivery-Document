SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH validation failed for f_test_execution.created_on_key' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.azure_test_result_final  where cdctype<>'D') SRC
LEFT JOIN  #DWH_TABLE_SCHEMA.d_calendar_date LKP
ON (date_format(convert_tz(SRC.createdDate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') = LKP.row_id)
left join  #DWH_TABLE_SCHEMA.f_test_execution TRGT
on concat(SRC.__numerify__primary_key,'')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(LKP.row_key, 0) <> coalesce(TRGT.created_on_key,'');
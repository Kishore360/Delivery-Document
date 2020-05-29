SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.WORK_START_ON' ELSE 'SUCCESS' END as Message

from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 
left join #STG_TABLE_SCHEMA.issue_dates_temp_azure strtd_dt
on SRC.__numerify__primary_key=strtd_dt.issueid
and SRC.sourceinstance=strtd_dt.sourceinstance 
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(convert_tz(strtd_dt.work_start_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.work_start_on,'')
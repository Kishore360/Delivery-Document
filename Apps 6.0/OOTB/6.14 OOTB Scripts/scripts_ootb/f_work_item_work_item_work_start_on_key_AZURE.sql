SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.work_item_work_start_on_key' ELSE 'SUCCESS' END as Message
from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 
left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
on SRC.__numerify__primary_key=dates.issueid
and SRC.sourceinstance=dates.sourceinstance
 
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(dates.work_start_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0)
 
 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id

 where coalesce(LKP.row_key,'') <> coalesce(TRGT.work_item_work_start_on_key,'')
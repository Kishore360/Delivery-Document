SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.completed_on_key' ELSE 'SUCCESS' END as Message
from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 
left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
on SRC.__numerify__primary_key=dates.issueid
and SRC.sourceinstance=dates.sourceinstance

LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP_COMPLETED
on (LKP_COMPLETED.row_id  = date_format(convert_tz(coalesce(dates.completed_on, SRC.msvsts_common_closeddate),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP_COMPLETED.source_id=0)

 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map STS
on concat('STATUS~WORK_ITEM~',upper(SRC.`state`))=STS.src_rowid and SRC.sourceinstance = STS.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.msvsts_common_resolvedreason))=RES.src_rowid and SRC.sourceinstance = RES.source_id
  
 where coalesce(case when STS.dimension_wh_code='COMPLETED' and (RES.dimension_wh_code<>'CANCELLED' or RES.dimension_wh_code is null) then LKP_COMPLETED.row_key else 0 end,0) <>coalesce(TRGT.completed_on_key,'')
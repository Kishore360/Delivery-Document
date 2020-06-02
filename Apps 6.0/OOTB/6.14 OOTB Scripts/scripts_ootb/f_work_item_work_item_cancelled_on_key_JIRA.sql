SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.work_item_cancelled_on_key' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.issue_final SRC
 
left join #STG_TABLE_SCHEMA.issue_dates_temp dates
on dates.issueid = SRC.id and dates.sourceinstance = SRC.sourceinstance
 
 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id

 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on concat('STATUS~WORK_ITEM~',upper(SRC.status_id))=DM.src_rowid and SRC.sourceinstance = DM.source_id
 
 left join #DWH_TABLE_SCHEMA.d_lov_map RES
 on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.resolution_id))=RES.src_rowid and SRC.sourceinstance = RES.source_id
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
 on (LKP.row_id  = date_format(convert_tz(case when (DM.dimension_wh_code in ('CANCELLED') AND (RES.dimension_wh_code != 'CANCELLED' OR RES.dimension_wh_code IS NULL)) then dates.cancelled_on
 when DM.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED') AND RES.dimension_wh_code  in ('CANCELLED') then COALESCE(SRC.resolutiondate,dates.cancelled_on)
 else 'UNSPECIFIED' end,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0)
  
 where coalesce(case when (DM.dimension_wh_code in ('CANCELLED') or RES.dimension_wh_code in ('CANCELLED')) then LKP.row_key else 0 end,0) <>coalesce(TRGT.work_item_cancelled_on_key,'0')
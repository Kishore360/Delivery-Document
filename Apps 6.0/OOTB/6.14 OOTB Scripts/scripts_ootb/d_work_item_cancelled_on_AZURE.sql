SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.cancelled_on' ELSE 'SUCCESS' END as Message

from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 
left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
 
on SRC.__numerify__primary_key=dates.issueid
and SRC.sourceinstance=dates.sourceinstance

left join #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
left join #DWH_TABLE_SCHEMA.d_lov_map DM
on concat('STATUS~WORK_ITEM~',SRC.`state`)=DM.src_rowid

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.msvsts_common_resolvedreason))=RES.src_rowid and SRC.sourceinstance = RES.source_id

where convert_tz(case when (DM.dimension_wh_code in ('CANCELLED') AND (RES.dimension_wh_code != 'CANCELLED' OR RES.dimension_wh_code IS NULL)) then dates.cancelled_on
 when DM.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED') AND RES.dimension_wh_code  in ('CANCELLED') then COALESCE(SRC.msvsts_common_resolveddate,dates.cancelled_on)
 else null end,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <>coalesce(TRGT.cancelled_on,'');
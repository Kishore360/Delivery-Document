SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.age_since_in_progress' ELSE 'SUCCESS' END as Message
/*SELECT TRGT.row_key, TRGT.row_id, DM.dimension_wh_code, 
coalesce(case 
 when DM.dimension_wh_code='PROPOSED' then 0
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') and dates.work_start_on is not null 
 then timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(SRC.msvsts_common_resolveddate, case when DM.dimension_wh_code in ('COMPLETED','RESOLVED') then coalesce(SRC.msvsts_common_closeddate, dates.completed_on) else null end, dates.cancelled_on))
 when DM.dimension_wh_code in ('CANCELLED') and dates.work_start_on is not null then timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(SRC.msvsts_common_resolveddate, dates.cancelled_on))  
 when DM.dimension_wh_code in('IN PROGRESS') and dates.work_start_on is not null then timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) 
 else 0 end,0) sr, coalesce(TRGT.age_since_in_progress,'') tg*/
 from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 
left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
on SRC.__numerify__primary_key=dates.issueid
and SRC.sourceinstance=dates.sourceinstance

LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) FRESH ON(FRESH.source_id=SRC.sourceinstance)
 
 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
left join #DWH_TABLE_SCHEMA.d_lov_map DM
on concat('STATUS~WORK_ITEM~',upper(SRC.`state`))=DM.src_rowid and SRC.sourceinstance = DM.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.msvsts_common_resolvedreason))=RES.src_rowid and SRC.sourceinstance = RES.source_id
 
 where coalesce(case 
 when DM.dimension_wh_code='PROPOSED' then 0
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') and dates.work_start_on is not null 
 then timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(SRC.msvsts_common_resolveddate, 
 case when DM.dimension_wh_code in ('COMPLETED','RESOLVED') then coalesce(dates.completed_on, SRC.msvsts_common_closeddate) else null end, dates.cancelled_on))
 when DM.dimension_wh_code in ('CANCELLED') 
 and dates.work_start_on is not null then timestampdiff(second,coalesce(dates.work_start_on,0),
 coalesce(SRC.msvsts_common_resolveddate, dates.cancelled_on))  
 when DM.dimension_wh_code in('IN PROGRESS') 
 and dates.work_start_on is not null then timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) 
 else 0 end,0) <>coalesce(TRGT.age_since_in_progress,'');
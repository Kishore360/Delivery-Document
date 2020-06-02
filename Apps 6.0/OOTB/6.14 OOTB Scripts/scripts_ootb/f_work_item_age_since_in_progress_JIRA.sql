SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 then case when (coalesce(case 
 when DM.dimension_wh_code='PROPOSED' then 0
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') and dates.work_start_on is not null 
 then timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(SRC.resolutiondate, 
 case when DM.dimension_wh_code in ('COMPLETED','RESOLVED') then dates.completed_on else null end, dates.cancelled_on))
 when DM.dimension_wh_code in ('CANCELLED') 
 and dates.work_start_on is not null then timestampdiff(second,coalesce(dates.work_start_on,0), coalesce(dates.cancelled_on))
 when DM.dimension_wh_code in('IN PROGRESS') 
 and dates.work_start_on is not null then timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) 
 else 0 end,0) - coalesce(TRGT.age_since_in_progress,'')) in (-3600, 3600) 
 then 'Failing due to timezone conversion issue for f_work_item.age_since_in_progress'
 ELSE  'MDS to DWH data validation failed for f_work_item.age_since_in_progress' END ELSE 'SUCCESS' END as Message
/*SELECT TRGT.row_key, TRGT.row_id, TRGT.work_item_key, DM.dimension_wh_code, RES.dimension_wh_code,
dates.created_on, dates.work_start_on, SRC.resolutiondate, dates.resolved_on, dates.completed_on, dates.cancelled_on, 
convert_tz(FRESH.lastupdated,'America/Los_Angeles','GMT') etl_run_date,
timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(SRC.resolutiondate, 
 case when DM.dimension_wh_code in ('COMPLETED','RESOLVED') then dates.completed_on else null end, dates.cancelled_on)) age_res_cmp,
timestampdiff(second,coalesce(dates.work_start_on,0),
 coalesce(dates.cancelled_on)) age_canc,
timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(convert_tz(FRESH.lastupdated,'America/Los_Angeles','GMT'),0)) age_in_prog,

coalesce(case 
 when DM.dimension_wh_code='PROPOSED' then 0
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') and dates.work_start_on is not null 
 then timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(SRC.resolutiondate, 
 case when DM.dimension_wh_code in ('COMPLETED','RESOLVED') then dates.completed_on else null end, dates.cancelled_on))
 when DM.dimension_wh_code in ('CANCELLED') 
 and dates.work_start_on is not null then timestampdiff(second,coalesce(dates.work_start_on,0), coalesce(dates.cancelled_on))
 when DM.dimension_wh_code in('IN PROGRESS') 
 and dates.work_start_on is not null then timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) 
 else 0 end,0) sr, coalesce(TRGT.age_since_in_progress,'') tg*/
 from #MDS_TABLE_SCHEMA.issue_final SRC
 
left join #STG_TABLE_SCHEMA.issue_dates_temp dates
on SRC.id=dates.issueid
and SRC.sourceinstance=dates.sourceinstance

 
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 where soft_deleted_flag <> 'Y'
 group by source_id
 ) FRESH ON(FRESH.source_id=SRC.sourceinstance)
 
 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 left join #DWH_TABLE_SCHEMA.d_work_item LKP1
 on concat(SRC.id, '')=LKP1.row_id
 and SRC.sourceinstance=LKP1.source_id
  
 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on concat('STATUS~WORK_ITEM','~',upper(SRC.status_id))=DM.src_rowid and SRC.sourceinstance = DM.source_id
 and DM.dimension_class = 'STATUS~WORK_ITEM'
 
 left join #DWH_TABLE_SCHEMA.d_lov_map RES
 on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.resolution_id))=RES.src_rowid and SRC.sourceinstance = RES.source_id
 and RES.dimension_class = 'RESOLUTION~WORK_ITEM'
 
 where coalesce(case 
 when DM.dimension_wh_code='PROPOSED' then 0
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') and dates.work_start_on is not null 
 then timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(SRC.resolutiondate, 
 case when DM.dimension_wh_code in ('COMPLETED','RESOLVED') then dates.completed_on else null end, dates.cancelled_on))
 when DM.dimension_wh_code in ('CANCELLED') 
 and dates.work_start_on is not null then timestampdiff(second,coalesce(dates.work_start_on,0), coalesce(dates.cancelled_on))
 when DM.dimension_wh_code in('IN PROGRESS') 
 and dates.work_start_on is not null then timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) 
 else 0 end,0) <>coalesce(TRGT.age_since_in_progress,'');
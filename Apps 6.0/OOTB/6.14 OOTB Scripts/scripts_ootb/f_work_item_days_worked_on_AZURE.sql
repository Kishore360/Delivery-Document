SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.days_worked_on' ELSE 'SUCCESS' END as Message
/*SELECT TRGT.row_id, TRGT.row_key, SRC.id,TYP.dimension_wh_code, STS.dimension_wh_code, LKP.work_item_key, dates.created_on, dates.resolved_on, dates.completed_on,LKP.days_worked_on ,
coalesce(case when TYP.dimension_wh_code in ('BUG') then
case when LKP.work_item_key is not null and STS.dimension_wh_code in ('RESOLVED', 'COMPLETED', 'CANCELLED') and LKP.days_worked_on = 0 then timestampdiff(second,dates.created_on,coalesce(dates.resolved_on, dates.completed_on, dates.cancelled_on))
when LKP.work_item_key is not null then LKP.days_worked_on 
when LKP.work_item_key is null and STS.dimension_wh_code = 'IN PROGRESS' then timestampdiff(second, SRC.createdDate, convert_tz(FRESH.lastupdated, '<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')) else 0 end else 0 end,0) sr, coalesce(TRGT.days_worked_on,'') tg*/
from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(SRC.__numerify__primary_key, '')=D.row_id
and SRC.sourceinstance=D.source_id

left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
on D.row_id=dates.issueid
and D.source_id=dates.sourceinstance

left join 
(
select LKP.work_item_key, LKP.source_id, 
sum(case when (STS_TO.dimension_wh_code in ('RESOLVED', 'COMPLETED', 'CANCELLED') and STS_FRM.dimension_wh_code in ('PROPOSED')) or STS_TO.dimension_wh_code in ('IN PROGRESS') then LKP.primary_duration else 0 end) as days_worked_on
from #DWH_TABLE_SCHEMA.f_work_item_activity LKP

left join #DWH_TABLE_SCHEMA.d_lov_map STS_TO
on LKP.task_attribute_wh_new_value_key=STS_TO.src_key and LKP.source_id = STS_TO.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map STS_FRM
on LKP.task_attribute_wh_old_value_key=STS_FRM.src_key and LKP.source_id = STS_FRM.source_id
where LKP.task_attribute_wh_name = 'STATUS' 
group by LKP.work_item_key, LKP.source_id
) LKP 
on D.row_key=LKP.work_item_key and D.source_id=LKP.source_id

left join #DWH_TABLE_SCHEMA.f_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.workItemType))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map STS
on concat('STATUS~WORK_ITEM~',upper(SRC.`state`))=STS.src_rowid and SRC.sourceinstance = STS.source_id

LEFT JOIN (select source_id,max(lastupdated) as lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) FRESH 
ON (FRESH.source_id=SRC.sourceinstance)
 
where coalesce(case when TYP.dimension_wh_code in ('BUG') then
case when LKP.work_item_key is not null and STS.dimension_wh_code in ('RESOLVED', 'COMPLETED', 'CANCELLED') and LKP.days_worked_on = 0 then timestampdiff(second,dates.created_on,coalesce(dates.resolved_on, dates.completed_on, dates.cancelled_on))
when LKP.work_item_key is not null then LKP.days_worked_on 
when LKP.work_item_key is null and STS.dimension_wh_code = 'IN PROGRESS' then timestampdiff(second, SRC.createdDate, convert_tz(FRESH.lastupdated, '<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')) else 0 end else 0 end,0) <>coalesce(TRGT.days_worked_on,'');
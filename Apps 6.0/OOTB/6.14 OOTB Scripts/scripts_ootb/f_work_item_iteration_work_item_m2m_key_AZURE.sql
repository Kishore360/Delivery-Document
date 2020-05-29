SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_iteration.work_item_m2m_key' ELSE 'SUCCESS' END as Message
 
 /*SELECT TRGT.row_key, TRGT.row_id, TRGT.work_item_key,LM.dimension_wh_code, RES.dimension_wh_code,
 LKP_SRC.msvsts_common_closeddate, dates.completed_on, LKP_SRC.msvsts_common_resolveddate,LKP_SRC.createdDate,dates.cancelled_on,
date_format(convert_tz(
case when LM.dimension_wh_code in ('COMPLETED') and (RES.dimension_wh_code not in ('CANCELLED') or RES.dimension_wh_code is null) then case when (coalesce(LKP_SRC.msvsts_common_closeddate, dates.completed_on) >= LKP_SRC.msvsts_common_resolveddate or LKP_SRC.msvsts_common_resolveddate is null)
and coalesce(LKP_SRC.msvsts_common_closeddate, dates.completed_on) is not null then coalesce(LKP_SRC.msvsts_common_closeddate, dates.completed_on)
else coalesce(LKP_SRC.msvsts_common_resolveddate, LKP_SRC.createdDate) end
when LM.dimension_wh_code in ('COMPLETED') and RES.dimension_wh_code in ('CANCELLED') then coalesce(dates.cancelled_on,LKP_SRC.msvsts_common_closeddate, dates.completed_on)
when LM.dimension_wh_code in ('CANCELLED') then coalesce(dates.cancelled_on, LKP_SRC.createdDate)
when LM.dimension_wh_code in ('RESOLVED') and LKP_SRC.msvsts_common_resolveddate is not null then LKP_SRC.msvsts_common_resolveddate
else LKP_SRC.createdDate end,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') val,
 coalesce(LKP.row_key, 0) expc, COALESCE(TRGT.work_item_m2m_key, '') actl*/
 
 from 
(
select 
rev.workItemKey,
rev.newValue,
rev.organizationKey,
concat(rev.workItemKey,'~',rev.newValue,'~',rev.organizationKey) as sys_id,
temp.projectKey,
rev.newValueKey,
rev.sourceinstance,
rev.cdctype,
rev.revisedByKey,
rev.revisedDate
from #MDS_TABLE_SCHEMA.azure_workitem_update_final rev 
left join #STG_TABLE_SCHEMA.workitem_temp_azure temp
on rev.workItemKey = temp.__numerify__primary_key and rev.sourceinstance = temp.sourceinstance
where rev.cdctype <> 'D' and temp.cdctype <> 'D' and rev.fieldName = 'iterationIdKey') SRC
 
left join #DWH_TABLE_SCHEMA.f_work_item_iteration TRGT
on SRC.sys_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
left join #STG_TABLE_SCHEMA.workitem_temp_azure LKP_SRC
on SRC.workItemKey=LKP_SRC.__numerify__primary_key
and SRC.sourceinstance=LKP_SRC.sourceinstance

left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
on LKP_SRC.__numerify__primary_key=dates.issueid
and LKP_SRC.sourceinstance=dates.sourceinstance

left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP_SRC.`state`))=LM.src_rowid and LKP_SRC.sourceinstance = LM.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM','~',upper(LKP_SRC.msvsts_common_resolvedreason))=RES.src_rowid and LKP_SRC.sourceinstance = RES.source_id
 
LEFT JOIN  #DWH_TABLE_SCHEMA.d_calendar_date LKP
on (date_format(convert_tz(
case when LM.dimension_wh_code in ('COMPLETED') and (RES.dimension_wh_code not in ('CANCELLED') or RES.dimension_wh_code is null) then case when (coalesce(LKP_SRC.msvsts_common_closeddate, dates.completed_on) >= LKP_SRC.msvsts_common_resolveddate or LKP_SRC.msvsts_common_resolveddate is null)
and coalesce(LKP_SRC.msvsts_common_closeddate, dates.completed_on) is not null then coalesce(LKP_SRC.msvsts_common_closeddate, dates.completed_on)
else coalesce(LKP_SRC.msvsts_common_resolveddate, LKP_SRC.createdDate) end
when LM.dimension_wh_code in ('COMPLETED') and RES.dimension_wh_code in ('CANCELLED') then coalesce(dates.cancelled_on,LKP_SRC.msvsts_common_closeddate, dates.completed_on)
when LM.dimension_wh_code in ('CANCELLED') then coalesce(dates.cancelled_on, LKP_SRC.createdDate)
when LM.dimension_wh_code in ('RESOLVED') and LKP_SRC.msvsts_common_resolveddate is not null then LKP_SRC.msvsts_common_resolveddate
else LKP_SRC.createdDate end,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') = LKP.row_id)

where TRGT.soft_deleted_flag <> 'Y' and 
coalesce(LKP.row_key, 0) <> COALESCE(TRGT.work_item_m2m_key, '');
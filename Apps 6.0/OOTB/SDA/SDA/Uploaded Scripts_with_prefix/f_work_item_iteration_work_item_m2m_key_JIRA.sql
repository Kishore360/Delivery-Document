SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_iteration.work_item_m2m_key' ELSE 'SUCCESS' END as Message
 
 /*SELECT TRGT.row_key, TRGT.row_id, TRGT.work_item_key,LM.dimension_wh_code, RES.dimension_wh_code,
 dates.completed_on, LKP_SRC.resolutiondate,LKP_SRC.created,dates.cancelled_on,
date_format(convert_tz(
case when LM.dimension_wh_code in ('COMPLETED') then case when (dates.completed_on >= LKP_SRC.resolutiondate or LKP_SRC.resolutiondate is null)
and dates.completed_on is not null then dates.completed_on
else coalesce(LKP_SRC.resolutiondate, LKP_SRC.created) end
when LM.dimension_wh_code in ('CANCELLED') then dates.cancelled_on
when LM.dimension_wh_code in ('RESOLVED') and LKP_SRC.resolutiondate is not null then LKP_SRC.resolutiondate
else LKP_SRC.created end,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') val,
 coalesce(LKP.row_key, 0) expc, COALESCE(TRGT.work_item_m2m_key, '') actl*/
 
 from 
(
 select SRCA.id issue, SRCA.sprintid sprint, SRCA.sourceinstance sourceinstance, SRCA.cdctype cdctype
 from #MDS_TABLE_SCHEMA.issues_sprint_final SRCA
 where SRCA.sprintid is not null and SRCA.sprintid >0
 union 
 select SRCB.issueid issue, SRCB.id sprint, SRCB.sourceinstance sourceinstance, SRCB.cdctype cdctype
 from #MDS_TABLE_SCHEMA.issue_closedsprints_final SRCB
 join #MDS_TABLE_SCHEMA.issue_final a 
 on a.id = SRCB.issueid and a.sourceinstance = SRCB.sourceinstance
 where SRCB.id is not null and SRCB.id > 0
 ) SRC
 
left join #DWH_TABLE_SCHEMA.f_work_item_iteration TRGT
on concat(SRC.issue,'~',SRC.sprint)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
left join #MDS_TABLE_SCHEMA.issue_final LKP_SRC
on SRC.issue=LKP_SRC.id
and SRC.sourceinstance=LKP_SRC.sourceinstance

left join #STG_TABLE_SCHEMA.issue_dates_temp dates
on LKP_SRC.id=dates.issueid
and LKP_SRC.sourceinstance=dates.sourceinstance

left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP_SRC.status_id))=LM.src_rowid and LKP_SRC.sourceinstance = LM.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM','~',upper(LKP_SRC.resolution_id))=RES.src_rowid and LKP_SRC.sourceinstance = RES.source_id
 
LEFT JOIN  #DWH_TABLE_SCHEMA.d_calendar_date LKP
on (date_format(convert_tz(
case when LM.dimension_wh_code in ('COMPLETED') then case when (dates.completed_on >= LKP_SRC.resolutiondate or LKP_SRC.resolutiondate is null)
and dates.completed_on is not null then dates.completed_on
else coalesce(LKP_SRC.resolutiondate, LKP_SRC.created) end
when LM.dimension_wh_code in ('CANCELLED') then coalesce(dates.cancelled_on, LKP_SRC.created)
when LM.dimension_wh_code in ('RESOLVED') and LKP_SRC.resolutiondate is not null then LKP_SRC.resolutiondate
else LKP_SRC.created end,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') = LKP.row_id)

where coalesce(LKP.row_key, 0) <> COALESCE(TRGT.work_item_m2m_key, '');
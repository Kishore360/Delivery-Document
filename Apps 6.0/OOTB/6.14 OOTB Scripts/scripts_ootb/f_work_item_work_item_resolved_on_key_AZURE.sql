SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.work_item_resolved_on_key' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 

left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
on SRC.__numerify__primary_key=dates.issueid and SRC.sourceinstance=dates.sourceinstance

LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )

LEFT JOIN  #DWH_TABLE_SCHEMA.d_calendar_date LKP
ON (date_format(convert_tz(coalesce(SRC.msvsts_common_resolveddate,dates.completed_on),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') = LKP.row_id)

left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',UPPER(SRC.`state`))=LM.src_rowid and SRC.sourceinstance = LM.source_id
 
where coalesce(case when LM.dimension_wh_code in ('RESOLVED' , 'COMPLETED') then LKP.row_key else 0 end, 0) <> coalesce(TRGT.work_item_resolved_on_key,'');
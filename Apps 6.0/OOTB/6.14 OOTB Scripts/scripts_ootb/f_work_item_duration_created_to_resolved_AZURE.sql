SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.duration_created_to_resolved' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
on SRC.__numerify__primary_key=dates.issueid
and SRC.sourceinstance=dates.sourceinstance

left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(SRC.`state`))=LM.src_rowid

 left join #DWH_TABLE_SCHEMA.d_lov_map RES
 on concat('RESOLUTION~WORK_ITEM~',upper(SRC.msvsts_common_resolvedreason))=RES.src_rowid and SRC.sourceinstance = RES.source_id

WHERE COALESCE(case when LM.dimension_wh_code in ('COMPLETED', 'RESOLVED') and RES.dimension_wh_code in ('CANCELLED') then 0 
when LM.dimension_wh_code in ('COMPLETED', 'RESOLVED') and SRC.createdDate is not null
then timestampdiff(second, SRC.createdDate, COALESCE(SRC.msvsts_common_resolveddate, dates.completed_on)) else 0 end, 0)<> COALESCE(TRGT.duration_created_to_resolved,'');
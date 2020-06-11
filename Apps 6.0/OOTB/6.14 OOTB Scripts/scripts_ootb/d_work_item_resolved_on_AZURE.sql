SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.resolved_on' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',UPPER(SRC.state))=LM.src_rowid AND SRC.sourceinstance=LM.source_id

-- left join #DWH_TABLE_SCHEMA.d_lov_map RES
-- on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.ResolutionId))=RES.src_rowid

left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
on SRC.__numerify__primary_key=dates.issueid
and SRC.sourceinstance=dates.sourceinstance

WHERE coalesce(case when LM.dimension_wh_code in ('RESOLVED' , 'COMPLETED') then 
convert_tz(SRC.msvsts_common_resolveddate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') else '' end, '') 
<> coalesce(TRGT.resolved_on,'');
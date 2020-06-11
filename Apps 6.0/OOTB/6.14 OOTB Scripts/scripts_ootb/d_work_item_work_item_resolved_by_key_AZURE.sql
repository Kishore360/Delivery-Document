SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.work_item_resolved_by_key' ELSE 'SUCCESS' END as Message
 /*SELECT TRGT.row_id, TRGT.row_key,DM.dimension_wh_code, resolved_by.resolved_by,
case when DM.dimension_wh_code not in ('RESOLVED', 'COMPLETED') then 'UNSPECIFIED'
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') and ASCII(COALESCE(dates.resolved_by,'')) = 0 THEN 'UNSPECIFIED' 
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then CONCAT('INTERNAL_CONTACT~',dates.resolved_by)
 else 'UNKNOWN' end lkp_row_id,
COALESCE(LKP.row_key, case when DM.dimension_wh_code not in ('RESOLVED') then 0 else -1 end) sr, coalesce(TRGT.work_item_resolved_by_key,'') tg*/
 
 FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 

 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on concat('STATUS~WORK_ITEM~',upper(SRC.`state`))=DM.src_rowid
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
 left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
 on dates.issueid = SRC.__numerify__primary_key and dates.sourceinstance = SRC.sourceinstance 
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON (case when DM.dimension_wh_code not in ('RESOLVED', 'COMPLETED') then 'UNSPECIFIED'
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') and ASCII(COALESCE(SRC.msvsts_common_resolvedbykey, SRC.msvsts_common_closedbykey, dates.resolved_by, dates.closed_by)) = 0 THEN 'UNSPECIFIED' 
 when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then CONCAT('INTERNAL_CONTACT~',COALESCE(SRC.msvsts_common_resolvedbykey, SRC.msvsts_common_closedbykey, dates.resolved_by, dates.closed_by, ''))
 else 'UNKNOWN' end = LKP.row_id 
 AND (SRC.sourceinstance = LKP.source_id or LKP.source_id = 0))
  
 WHERE TRGT.soft_deleted_flag = 'N' and 
 COALESCE(LKP.row_key, case when DM.dimension_wh_code not in ('RESOLVED') then 0 else -1 end)<>coalesce(TRGT.work_item_resolved_by_key,'');
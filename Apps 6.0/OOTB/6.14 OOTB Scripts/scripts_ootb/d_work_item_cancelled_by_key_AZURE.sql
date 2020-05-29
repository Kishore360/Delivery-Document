SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.cancelled_by_key' ELSE 'SUCCESS' END as Message
 /*SELECT TRGT.row_id, TRGT.row_key,DM.dimension_wh_code, SRC.assigneeid, SQ.authorkey,
(case when (DM.dimension_wh_code not in ('CANCELLED') and RES.dimension_wh_code not in ('CANCELLED')) then 'UNSPECIFIED'
 when (DM.dimension_wh_code in ('CANCELLED') or RES.dimension_wh_code in ('CANCELLED')) then CONCAT('INTERNAL_CONTACT~',SQ.authorkey)
 when ASCII(COALESCE(SRC.assigneeid,'')) = 0 THEN 'UNSPECIFIED'
 else 'UNKNOWN' end) lkp_row_id,
COALESCE(LKP.row_key, 0) sr, coalesce(TRGT.cancelled_by_key,'') tg*/
 
 FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 

 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on concat('STATUS~WORK_ITEM~',upper(SRC.`state`))=DM.src_rowid and SRC.sourceinstance = DM.source_id

 left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.msvsts_common_resolvedreason))=RES.src_rowid and SRC.sourceinstance = RES.source_id
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
 left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
 on dates.issueid = SRC.__numerify__primary_key and dates.sourceinstance = SRC.sourceinstance

 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ((case when DM.dimension_wh_code in ('CANCELLED') AND (RES.dimension_wh_code != 'CANCELLED' OR RES.dimension_wh_code IS NULL) then CONCAT('INTERNAL_CONTACT~',dates.cancelled_by)
  when DM.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED') then case when RES.dimension_wh_code in ('CANCELLED') then CONCAT('INTERNAL_CONTACT~',coalesce(COALESCE(SRC.msvsts_common_resolvedbykey, dates.resolved_by), dates.cancelled_by, coalesce(SRC.msvsts_common_closedbykey, dates.closed_by))) else 'UNSPECIFIED' end
  when DM.dimension_wh_code not in ('RESOLVED', 'COMPLETED', 'CANCELLED') THEN 'UNSPECIFIED'
  when ASCII(COALESCE(dates.cancelled_by,'')) = 0 THEN 'UNSPECIFIED'
  else 'UNKNOWN' end) = LKP.row_id 
 AND (SRC.sourceinstance = LKP.source_id or LKP.source_id = 0))
WHERE COALESCE(LKP.row_key, case when (DM.dimension_wh_code in ('CANCELLED') or RES.dimension_wh_code in ('CANCELLED')) and CONCAT('INTERNAL_CONTACT~',dates.cancelled_by) is not null then -1 else 0 end) <> coalesce(TRGT.cancelled_by_key,'');
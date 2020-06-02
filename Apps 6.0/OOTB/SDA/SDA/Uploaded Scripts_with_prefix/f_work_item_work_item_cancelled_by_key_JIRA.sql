SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.work_item_cancelled_by_key' ELSE 'SUCCESS' END as Message
 /*SELECT TRGT.row_id, TRGT.row_key,SRC.key, DM.dimension_wh_code status, RES.dimension_wh_code reso, 
cncld_by.author_key cncld_by, resolved_by.author_key resolved_by, completed_by.author_key completed_by,

(case when DM.dimension_wh_code in ('CANCELLED') then CONCAT('INTERNAL_CONTACT~',cncld_by.author_key)
  when DM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then case when RES.dimension_wh_code in ('CANCELLED') then CONCAT('INTERNAL_CONTACT~',coalesce(resolved_by.author_key,completed_by.author_key)) else 'UNSPECIFIED' end
  when DM.dimension_wh_code not in ('RESOLVED', 'COMPLETED', 'CANCELLED') THEN 'UNSPECIFIED'
  when ASCII(COALESCE(cncld_by.author_key,'')) = 0 THEN 'UNSPECIFIED'
  else 'UNKNOWN' end) lkp_row_id,
COALESCE(LKP.row_key, case when (DM.dimension_wh_code in ('CANCELLED') or RES.dimension_wh_code in ('CANCELLED')) and CONCAT('INTERNAL_CONTACT~',cncld_by.author_key) is not null then -1 else 0 end) sr, 
coalesce(TRGT.work_item_cancelled_by_key,'') tg*/
   
 FROM #MDS_TABLE_SCHEMA.issue_final SRC 

 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on concat('STATUS~WORK_ITEM~',upper(SRC.statusid))=DM.src_rowid and SRC.sourceinstance = DM.source_id
 
 left join #DWH_TABLE_SCHEMA.d_lov_map RES
 on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.resolution_id))=RES.src_rowid and SRC.sourceinstance = RES.source_id
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
 left join #STG_TABLE_SCHEMA.issue_dates_temp dates
 on dates.issueid = SRC.id and dates.sourceinstance = SRC.sourceinstance

 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ((case when DM.dimension_wh_code in ('CANCELLED') AND (RES.dimension_wh_code != 'CANCELLED' OR RES.dimension_wh_code IS NULL) then CONCAT('INTERNAL_CONTACT~',dates.cancelled_by)
  when DM.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED') then case when RES.dimension_wh_code in ('CANCELLED') then CONCAT('INTERNAL_CONTACT~',coalesce(dates.resolved_by, dates.cancelled_by, dates.closed_by)) else 'UNSPECIFIED' end
  when DM.dimension_wh_code not in ('RESOLVED', 'COMPLETED', 'CANCELLED') THEN 'UNSPECIFIED'
  when ASCII(COALESCE(dates.cancelled_by,'')) = 0 THEN 'UNSPECIFIED'
  else 'UNKNOWN' end) = LKP.row_id 
 AND (SRC.sourceinstance = LKP.source_id or LKP.source_id = 0))
WHERE COALESCE(LKP.row_key, case when (DM.dimension_wh_code in ('CANCELLED') or RES.dimension_wh_code in ('CANCELLED')) and CONCAT('INTERNAL_CONTACT~',dates.cancelled_by) is not null then -1 else 0 end) <> coalesce(TRGT.work_item_cancelled_by_key,'')
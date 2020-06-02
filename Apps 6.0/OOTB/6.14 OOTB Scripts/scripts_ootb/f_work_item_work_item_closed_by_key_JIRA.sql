SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.work_item_closed_by_key' ELSE 'SUCCESS' END as Message
 /*SELECT TRGT.row_id, TRGT.row_key,DM.dimension_wh_code, SRC.assigneeRef, SQ.closed_by,
(case when DM.dimension_wh_code not in ('COMPLETED') then 'UNSPECIFIED'
 when DM.dimension_wh_code='COMPLETED' then CONCAT('INTERNAL_CONTACT~',SQ.closed_by)
 when ASCII(COALESCE(SQ.closed_by,'')) = 0 THEN 'UNSPECIFIED'
 else 'UNKNOWN' end) lkp_row_id,
COALESCE(LKP.row_key, 0) sr, coalesce(TRGT.work_item_closed_by_key,'') tg*/
 
 FROM #MDS_TABLE_SCHEMA.issue_final SRC 

left join #DWH_TABLE_SCHEMA.d_lov_map DM
on concat('STATUS~WORK_ITEM~',SRC.status_id)=DM.src_rowid and SRC.sourceinstance=DM.source_id and DM.dimension_class = 'STATUS~WORK_ITEM'

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.resolution_id))=RES.src_rowid and SRC.sourceinstance=RES.source_id and RES.dimension_class = 'RESOLUTION~WORK_ITEM'
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
 left join #STG_TABLE_SCHEMA.issue_dates_temp SQ
 on SQ.issueid = SRC.id and SQ.sourceinstance = SRC.sourceinstance
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON (case when DM.dimension_wh_code not in ('COMPLETED') or (RES.dimension_wh_code = 'CANCELLED') then 'UNSPECIFIED'
 when DM.dimension_wh_code='COMPLETED' and (RES.dimension_wh_code<>'CANCELLED' or RES.dimension_wh_code is null) then CONCAT('INTERNAL_CONTACT~',SQ.closed_by)
 when ASCII(COALESCE(SQ.closed_by,'')) = 0 THEN 'UNSPECIFIED'
 else 'UNKNOWN' end = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id )
  
 WHERE COALESCE(LKP.row_key, case when DM.dimension_wh_code='COMPLETED' and (RES.dimension_wh_code<>'CANCELLED' or RES.dimension_wh_code is null) and CONCAT('INTERNAL_CONTACT~',SQ.closed_by) is not null then -1 else 0 end)<>coalesce(TRGT.work_item_closed_by_key,'');
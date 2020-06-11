SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.work_item_closed_by_key' ELSE 'SUCCESS' END as Message
 /*SELECT TRGT.row_id, TRGT.row_key,DM.dimension_wh_code stat, RES.dimension_wh_code reso, TRGT.soft_deleted_flag,
SRC.msvsts_common_closedbykey, dates.closed_by,
(case when DM.dimension_wh_code not in ('COMPLETED') or (RES.dimension_wh_code = 'CANCELLED') then 'UNSPECIFIED'
 when DM.dimension_wh_code='COMPLETED' and (RES.dimension_wh_code<>'CANCELLED' or RES.dimension_wh_code is null) then CONCAT('INTERNAL_CONTACT~',coalesce(SRC.msvsts_common_closedbykey, dates.closed_by,''))
 when ASCII(coalesce(SRC.msvsts_common_closedbykey, dates.closed_by,'')) = 0 THEN 'UNSPECIFIED'
 else 'UNKNOWN' end) lkp_row_id,
COALESCE(LKP.row_key, 0) sr, coalesce(TRGT.work_item_closed_by_key,'') tg*/
 
 FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 

 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on concat('STATUS~WORK_ITEM~',upper(SRC.`state`))=DM.src_rowid and SRC.sourceinstance = DM.source_id
 
left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.msvsts_common_resolvedreason))=RES.src_rowid and SRC.sourceinstance = RES.source_id
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
 left join 
 #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
on SRC.__numerify__primary_key=dates.issueid
and SRC.sourceinstance=dates.sourceinstance
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON (case when DM.dimension_wh_code not in ('COMPLETED') or (RES.dimension_wh_code = 'CANCELLED') then 'UNSPECIFIED'
 when DM.dimension_wh_code='COMPLETED' and (RES.dimension_wh_code<>'CANCELLED' or RES.dimension_wh_code is null) then CONCAT('INTERNAL_CONTACT~',coalesce(SRC.msvsts_common_closedbykey, dates.closed_by,''))
 when ASCII(coalesce(SRC.msvsts_common_closedbykey, dates.closed_by)) = 0 THEN 'UNSPECIFIED'
 else 'UNKNOWN' end = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id )
  
 WHERE COALESCE(LKP.row_key, case when DM.dimension_wh_code='COMPLETED' and (RES.dimension_wh_code<>'CANCELLED' or RES.dimension_wh_code is null) and CONCAT('INTERNAL_CONTACT~',coalesce(SRC.msvsts_common_closedbykey, dates.closed_by, '')) is not null then -1 else 0 end)<>coalesce(TRGT.work_item_closed_by_key,'');
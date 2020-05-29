SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.completed_on' ELSE 'SUCCESS' END as Message

from #MDS_TABLE_SCHEMA.issue_final SRC
 
left join #STG_TABLE_SCHEMA.issue_dates_temp compltd_dt
 
on SRC.id=compltd_dt.issueid
and SRC.sourceinstance=compltd_dt.sourceinstance

left join #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',SRC.status_id)=LM.src_rowid and SRC.sourceinstance=LM.source_id and LM.dimension_class = 'STATUS~WORK_ITEM'

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.resolution_id))=RES.src_rowid and SRC.sourceinstance=RES.source_id and RES.dimension_class = 'RESOLUTION~WORK_ITEM'
  
where coalesce(case when LM.dimension_wh_code = 'COMPLETED' and (RES.dimension_wh_code<>'CANCELLED' or RES.dimension_wh_code is null) then convert_tz(compltd_dt.completed_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') else null end, '') <>coalesce(TRGT.completed_on, '');
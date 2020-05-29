SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.invalid_flag' ELSE 'SUCCESS' END as Message

FROM #MDS_TABLE_SCHEMA.issue_final SRC 

left join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.issuetype_id))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id
 
left join #DWH_TABLE_SCHEMA.d_lov_map DM
on concat('STATUS~WORK_ITEM~',upper(SRC.status_id))=DM.src_rowid and SRC.sourceinstance = DM.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.resolution_id))=RES.src_rowid and SRC.sourceinstance = RES.source_id

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 
where TRGT.soft_deleted_flag <> 'Y' and 
coalesce(CASE when ((DM.dimension_wh_code in ('COMPLETED', 'RESOLVED','CANCELLED') and RES.dimension_wh_code in ('CANCELLED')) or DM.dimension_wh_code in ('CANCELLED')) then 'Y' ELSE 'N' end,'N' ) <>coalesce(TRGT.invalid_flag,'');
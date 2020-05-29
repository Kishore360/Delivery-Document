SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.defect_regression_flag' ELSE 'SUCCESS' END as Message

FROM #MDS_TABLE_SCHEMA.issue_final SRC 

left join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.issuetype_id))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id
 
left join #DWH_TABLE_SCHEMA.d_lov_map lov
on lov.src_rowid=coalesce(concat('DEFECT_TYPE~WORK_ITEM~',SRC.reason),'UNSPECIFIED')

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 
where TRGT.soft_deleted_flag <> 'Y' and 
coalesce(CASE when TYP.dimension_wh_code in ('BUG') and lov.dimension_wh_code in ('REGRESSION') then 'Y' ELSE 'N' end,'N' ) <>coalesce(TRGT.defect_regression_flag,'');
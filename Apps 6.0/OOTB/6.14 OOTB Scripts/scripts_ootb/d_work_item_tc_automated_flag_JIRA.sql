SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.tc_automated_flag' ELSE 'SUCCESS' END as Message

FROM #MDS_TABLE_SCHEMA.issue_final SRC 

left join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.issuetype_id))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id

LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map AM_STS
on AM_STS.src_rowid = concat('AUTOMATION_STATUS~WORK_ITEM~', SRC.msvsts_tcm_automationstatus) and AM_STS.source_id = SRC.sourceinstance
 
where TRGT.soft_deleted_flag <> 'Y' and 
coalesce(CASE when TYP.dimension_wh_code in ('TEST CASE') and AM_STS.dimension_wh_code = 'AUTOMATED' then 'Y' ELSE 'N' end,'N' ) <> coalesce(TRGT.tc_automated_flag,'');
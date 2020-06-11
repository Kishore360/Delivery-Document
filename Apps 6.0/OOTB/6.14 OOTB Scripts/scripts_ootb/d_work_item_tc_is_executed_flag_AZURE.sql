SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.tc_is_executed_flag' ELSE 'SUCCESS' END as Message

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 

left join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.workItemType))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id

LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id

LEFT JOIN #MDS_TABLE_SCHEMA.azure_test_result_final LKP
 on SRC.__numerify__primary_key=LKP.testCaseKey
 and SRC.sourceinstance=LKP.sourceinstance

where TRGT.soft_deleted_flag <> 'Y' and 
coalesce(CASE when TYP.dimension_wh_code in ('TEST CASE') and LKP.__numerify__primary_key is not null then 'Y' ELSE 'N' end,'N' ) <>coalesce(TRGT.tc_is_executed_flag,'');
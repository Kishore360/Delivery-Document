SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_result_build.src_rowid' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.azure_build_final where result is not null and result <> ''
group by result,sourceinstance)SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  CONCAT('RESULT~BUILD~',SRC.result)=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id
WHERE coalesce( CONCAT('RESULT~BUILD~',SRC.result),'')<>coalesce(TRGT.src_rowid,'')
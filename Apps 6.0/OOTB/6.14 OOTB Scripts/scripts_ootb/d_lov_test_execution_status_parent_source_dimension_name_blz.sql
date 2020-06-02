
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_test_execution_status.parent_source_dimension_name' ELSE 'SUCCESS' END as Message
FROM 

(select * from #MDS_TABLE_SCHEMA.blz_master_final where passed is not null and passed <> ''
group by passed,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  
CONCAT('TEST_EXECUTION~STATUS~',CASE WHEN SRC.passed=1 THEN 'PASS' WHEN SRC.passed=0 then 'FAIL' END)=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id
WHERE  COALESCE(TRGT.parent_source_dimension_name,'') <> COALESCE(NULL ,'')
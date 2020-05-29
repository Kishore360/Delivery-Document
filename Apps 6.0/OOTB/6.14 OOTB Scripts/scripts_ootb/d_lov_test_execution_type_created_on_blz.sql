SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_test_execution_type.created_on' ELSE 'SUCCESS' END as Message
FROM 
(select * from #MDS_TABLE_SCHEMA.blz_test_final where configuration_testMode is not null and configuration_scriptType is not null
and configuration_testMode <> '' and  configuration_testMode <> ''
group by configuration_testMode,configuration_scriptType,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  
CONCAT('TEST_EXECUTION~TEST_TYPE~',CASE WHEN SRC.configuration_testMode='http' THEN 'URL_TEST' WHEN configuration_testMode='script' 
THEN  CONCAT(UPPER(SRC.configuration_scriptType),'_TEST') END)=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id
WHERE  COALESCE(TRGT.created_on,'') <> COALESCE(NULL,'')
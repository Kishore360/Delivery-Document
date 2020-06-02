SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for D_APPLICATION.DESCRIPTION' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.ApmApplications_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_application TRGT 
ON CONCAT('APPLICATION~',SRC.name)=TRGT.row_id  
AND SRC.sourceinstance=TRGT.source_id 
WHERE COALESCE(SRC.description,'')<> COALESCE(TRGT.description,'') 
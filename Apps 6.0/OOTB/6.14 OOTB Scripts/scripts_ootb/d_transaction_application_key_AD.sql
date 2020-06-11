SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_transaction.APPLICATION_KEY' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.transactions_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_transaction TRGT 
ON SRC.__numerify__primary_key=TRGT.row_id  
AND SRC.sourceinstance=TRGT.source_id 
left join #DWH_TABLE_SCHEMA.d_application app
ON COALESCE(CONCAT('APPLICATION~',SRC.application),'UNSPECIFIED')=app.row_id  
AND SRC.sourceinstance=app.source_id 
where COALESCE(app.row_key, case when COALESCE(CONCAT('APPLICATION~',SRC.application),'UNSPECIFIED')is null then 0 else -1 end)<>coalesce(TRGT.application_key,'')







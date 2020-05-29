SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_transaction.TRANSACTION_NAME' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.transactions_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_transaction TRGT 
ON SRC.__numerify__primary_key=TRGT.row_id  
AND SRC.sourceinstance=TRGT.source_id 
WHERE COALESCE(SRC.application,'')<> COALESCE(TRGT.TRANSACTION_NAME,'')



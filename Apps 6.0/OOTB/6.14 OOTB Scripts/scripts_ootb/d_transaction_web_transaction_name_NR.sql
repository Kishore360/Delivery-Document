SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_transaction.web_transaction_name' ELSE 'SUCCESS' END as Message
-- select CONCAT(SRC.name, '~',SRC.appId),  SRC.browserTransactionName, TRGT.web_transaction_name 
from #MDS_TABLE_SCHEMA.PageView_final SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_transaction TRGT 
ON (CONCAT(SRC.name, '~', SRC.appId) =TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
where SRC.browserTransactionName <> TRGT.web_transaction_name;
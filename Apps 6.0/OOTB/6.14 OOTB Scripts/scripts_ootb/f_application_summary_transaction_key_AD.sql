

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_summary.TRANSACTION_KEY' 
ELSE 'SUCCESS' END as Message FROM
#MDS_TABLE_SCHEMA.transactions_final SRC LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 


ON SRC.__numerify__primary_key=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id

left join #DWH_TABLE_SCHEMA.d_transaction trns

ON CONCAT(COALESCE(SRC.application , 'UNSPECIFIED'),'~',COALESCE(SRC.transactionName , 'UNSPECIFIED'),'~',COALESCE(SRC.userExperience , 'UNSPECIFIED'),'~',
COALESCE(SRC.time_series, 'UNSPECIFIED'))=trns.row_id 
 


WHERE coalesce(trns.row_key,case when CONCAT(COALESCE(SRC.application , 'UNSPECIFIED'),'~',COALESCE(SRC.transactionName , 'UNSPECIFIED'),'~',
COALESCE(SRC.userExperience , 'UNSPECIFIED'),'~',COALESCE(SRC.time_series, 'UNSPECIFIED')) is null then 0 else -1 end)<>coalesce(TRGT.TRANSACTION_KEY,'') 

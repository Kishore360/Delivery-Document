SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_summary.COUNT_OF_RECORDS' ELSE 
'SUCCESS' END as Message
from (select TRGT.row_id from  #MDS_TABLE_SCHEMA.transactions_final SRC LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 

 ON SRC.__numerify__primary_key=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id

left join #DWH_TABLE_SCHEMA.d_application app

on COALESCE(CONCAT('APPLICATION~',SRC.application),'UNSPECIFIED')=app.row_id  AND SRC.sourceinstance=app.source_id 

WHERE coalesce(app.row_key, case when COALESCE(CONCAT('APPLICATION~',SRC.application),'UNSPECIFIED') 
is null then 0 else -1 END ) <> coalesce(TRGT.APPLICATION_KEY,'')) SQ






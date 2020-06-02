SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_summary.TIME_KEY' ELSE 'SUCCESS' END as Message
from  #MDS_TABLE_SCHEMA.transactions_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 
ON SRC.__numerify__primary_key=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_time calt 
ON COALESCE(DATE_FORMAT(SRC.time_series,'%h%i'),'UNSPECIFIED')= calt.row_id
WHERE coalesce(calt.row_key, case when COALESCE(DATE_FORMAT(SRC.time_series,'%h%i'),'UNSPECIFIED') is null then 0 else -1 end)<>coalesce(TRGT.TIME_KEY,'') 
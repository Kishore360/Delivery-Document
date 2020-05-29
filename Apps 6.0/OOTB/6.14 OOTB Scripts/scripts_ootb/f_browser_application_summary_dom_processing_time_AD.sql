SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_browser_application_summary.row_id' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.web_session_records_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_browser_application_summary TRGT 
ON SRC.__numerify__primary_key=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.DomReadyTime,0)<>COALESCE(TRGT.dom_processing_time,0)
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_mobile_application_summary.SESSION_ID' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.mobile_session_records_final SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_mobile_application_summary TRGT

ON SRC.__numerify__primary_key=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id

WHERE COALESCE(SRC.sessionguid,0)<>COALESCE(TRGT.SESSION_ID,'')


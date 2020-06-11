SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_mobile_application_summary.MOBILE_ERROR_COUNT' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.mobile_session_records_final SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_mobile_application_summary TRGT

ON (CONCAT(COALESCE(SRC.time_series,'UNSPECIFIED'),'~',COALESCE(SRC.sessionguid,'UNSPECIFIED'))=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id )

WHERE COALESCE(SRC.errorcount,0)<>COALESCE(TRGT.MOBILE_ERROR_COUNT,'')



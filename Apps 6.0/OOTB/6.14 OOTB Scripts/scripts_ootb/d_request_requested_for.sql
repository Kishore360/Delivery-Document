-- Logic as per ITSM-3970
-- opened_by_department,opened_by_department_department,opened_by_department_location,requested_for,requested_for_department,requested_for_location will be null

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.requested_for' ELSE 'SUCCESS' END as Message

FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE TRGT.requested_for <> '';
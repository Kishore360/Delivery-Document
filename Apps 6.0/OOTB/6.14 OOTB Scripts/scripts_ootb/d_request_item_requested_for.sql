-- Logic as per ITSM-3970

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.requested_for' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_req_item_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE TRGT.requested_for <> 'UNSPECIFIED';
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item_business_duration' ELSE 'SUCCESS' END as Message
FROM nypres_mdwdb.f_request_item TRGT 
JOIN nypres_mdwdb.d_request SRC_1
ON SRC_1.row_key = TRGT.request_key and SRC_1.source_id = TRGT.source_id
JOIN nypres_mdsdb.sc_request_final REQ 
ON (SRC_1.row_id = REQ.sys_id and SRC_1.source_id = REQ.sourceinstance)
WHERE TRGT.business_duration <> CASE WHEN REQ.business_duration is NULL  THEN NULL
				WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',REQ.business_duration) < 0 THEN NULL
				ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',REQ.business_duration) END;
;
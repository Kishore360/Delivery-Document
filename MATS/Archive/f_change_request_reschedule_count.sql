

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.reschedule_flag' ELSE 'SUCCESS' END as Message
 FROM 
(SELECT CASE WHEN TA.documentkey IS NULL THEN 0 ELSE COUNT(*) END as reschedule_count
,SRC.sys_id,SRC.sourceinstance
FROM #MDS_TABLE_SCHEMA.change_request_final SRC
LEFT JOIN #MDS_TABLE_SCHEMA.sys_audit_final TA
ON (TA.documentkey= SRC.sys_id
AND  TA.sourceinstance= SRC.sourceinstance
AND  TA.`tablename` = 'change_request'
AND TA.fieldname = 'end_date' AND  TA.newvalue <> TA.oldvalue )
GROUP BY SRC.sys_id,SRC.sourceinstance
) FSRC
LEFT JOIN #TABLE_SCHEMA.f_change_request TRGT 
 ON (convert(FSRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(FSRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
WHERE FSRC.reschedule_count<>TRGT.reschedule_count


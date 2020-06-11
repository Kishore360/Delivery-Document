SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.reschedule_count' ELSE 'SUCCESS' END as Message
 FROM 
(SELECT CASE WHEN TA.documentkey IS NULL THEN 0 ELSE COUNT(*) END as reschedule_count
,SRC.sys_id,SRC.sourceinstance
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') TA
ON (TA.documentkey= SRC.sys_id
AND  TA.sourceinstance= SRC.sourceinstance
AND  TA.`tablename` = 'change_request'
AND TA.fieldname = 'end_date' AND  coalesce(TA.newvalue,'') <> coalesce(TA.oldvalue,'')
and TA.oldvalue is not null )
GROUP BY SRC.sys_id,SRC.sourceinstance
) FSRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (FSRC.sys_id  =TRGT.row_id  
 AND FSRC.sourceinstance = TRGT.source_id  )
WHERE coalesce(FSRC.reschedule_count,0)<>coalesce(TRGT.reschedule_count,'')

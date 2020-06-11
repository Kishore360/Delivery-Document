SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.reschedule_count' ELSE 'SUCCESS' END as Message
  FROM 
(SELECT CASE WHEN TA.original_request_id IS NULL THEN 0 ELSE COUNT(*) END as reschedule_count
,SRC.infrastructure_change_id,SRC.sourceinstance,TA.original_request_id,TA.fields_changed
FROM ( SELECT * FROM   #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN (SELECT * FROM  #MDS_TABLE_SCHEMA.hlx_chg_audit_log_final WHERE CDCTYPE<>'D') TA
ON (TA.original_request_id= SRC.infrastructure_change_id
AND  TA.sourceinstance= SRC.sourceinstance
AND  TA.fields_changed like '%Scheduled End Date%')
GROUP BY SRC.infrastructure_change_id,SRC.sourceinstance
) FSRC
LEFT JOIN (select * from    #DWH_TABLE_SCHEMA.f_change_request)TRGT 
 ON (FSRC.infrastructure_change_id  =TRGT.row_id  
 AND FSRC.sourceinstance = TRGT.source_id  )
WHERE coalesce(FSRC.reschedule_count,0)<>coalesce(TRGT.reschedule_count,'')

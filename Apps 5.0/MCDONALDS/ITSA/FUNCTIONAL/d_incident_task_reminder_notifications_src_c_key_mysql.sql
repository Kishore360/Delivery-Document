SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.reminder_notifications_src_c_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.d_incident_task trgt
RIGHT JOIN mcdonalds_mdsdb.u_reminder_notifications src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_lov lkp
ON COALESCE(CONCAT('REMAINDER_NOTIFICATIONS_C~INCIDENT_TASK~~~',src.u_reminder_notifications),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_reminder_notifications IS NULL THEN 0 else -1 end)<> trgt.reminder_notifications_src_c_key;


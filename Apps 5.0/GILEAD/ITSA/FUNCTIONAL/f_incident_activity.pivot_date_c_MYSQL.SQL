

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_activity.pivot_date_c' ELSE 'SUCCESS' END as Message 
FROM gilead_mdsdb.sys_audit_final src
join gilead_mdwdb.f_incident_activity trgt 
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
WHERE  CONVERT_TZ (src.sys_created_on,'GMT','America/New_York') <> trgt.pivot_date_c
;
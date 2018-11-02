SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_task_c.parent_age_at_task_open' ELSE 'SUCCESS' END as Message 

FROM mcdonalds_mdwdb.f_incident_task_c trgt
RIGHT JOIN mcdonalds_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN mcdonalds_mdsdb.incident_final inc ON src.parent = inc.sys_id AND src.sourceinstance = inc.sourceinstance

WHERE 
IF(CONVERT_TZ(src.opened_at,'GMT','US/Central') > CONVERT_TZ(inc.opened_at,'GMT','US/Central'),TIMESTAMPDIFF(SECOND,CONVERT_TZ(inc.opened_at,'GMT','US/Central'),CONVERT_TZ(src.opened_at,'GMT','US/Central')), 0)
 = trgt.parent_age_at_task_open
;
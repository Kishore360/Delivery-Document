
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_request_c.source_url' ELSE 'SUCCESS' END as Message
   FROM mcdonalds_mdsdb.incident_task_final i
join mcdonalds_mdwdb.d_incident_task_c f on sys_id=f.row_id and sourceinstance=f.source_id where
CONCAT('<a href=\"https://servicecafe.service-now.com/nav_to.do?uri=/incident_task.do?sys_id=',i.sys_id,'\" target=\"_blank\" >'
,i.number,'</a>')
 <> f.source_url; 
 
 
 
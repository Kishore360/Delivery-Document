
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_request_c.source_url' ELSE 'SUCCESS' END as Message
   FROM pan_mdsdb.u_incident_tasks_final i
join pan_mdwdb.d_incident_tasks_c f on sys_id=f.row_id and sourceinstance=f.source_id where
CONCAT('<a href=\"https://panservicedesk.service-now.com/nav_to.do?uri=u_incident_tasks.do?sys_id=',i.sys_id,'\" target=\"_blank\">'
,i.number,'</a>')
 <> f.source_url; 
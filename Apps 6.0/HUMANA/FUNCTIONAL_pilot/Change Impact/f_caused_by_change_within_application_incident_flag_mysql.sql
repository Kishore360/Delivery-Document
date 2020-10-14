SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.'
ELSE 'Data Matched' END AS Message
FROM (select count(*) as cnt 
from
(select COALESCE(cmdb_ci_outage.sys_id, incident.sys_id) AS row_id,change_request.sourceinstance AS source_id,IF(incident.cmdb_ci = change_request.cmdb_ci, 'Y', 'N') AS within_application_incident_flag from
 ( SELECT sys_id, sourceinstance, CASE  WHEN cdctype = 'D' THEN 'Y'   ELSE 'N'  END soft_deleted_flag FROM humana_mdsdb.incident_final    
UNION
SELECT incident.sys_id , incident.sourceinstance ,  CASE  WHEN incident.cdctype = 'D' THEN 'Y'  ELSE 'N'  END soft_deleted_flag  FROM humana_mdsdb.incident_final incident    
JOIN  humana_mdsdb.change_request_final change_request 
 ON incident.caused_by = change_request.sys_id 
 AND incident.sourceinstance = change_request.sourceinstance 
 AND incident.opened_at >  COALESCE(change_request.work_start, change_request.start_date,  change_request.closed_at) 
 UNION
  SELECT incident.sys_id ,  incident.sourceinstance , CASE   WHEN incident.cdctype = 'D' THEN 'Y'   ELSE 'N'  END soft_deleted_flag 
 FROM humana_mdsdb.incident_final incident    
 JOIN
 humana_mdsdb.cmdb_ci_outage_final cmdb_ci_outage 
 ON incident.sys_id = cmdb_ci_outage.task_number 
 AND incident.sourceinstance = cmdb_ci_outage.sourceinstance 
  UNION
 SELECT
 incident.sys_id , incident.sourceinstance , CASE  WHEN incident.cdctype = 'D' THEN 'Y'  ELSE 'N'  END soft_deleted_flag 
  FROM  humana_mdsdb.incident_final incident    
 JOIN
 humana_mdsdb.problem_final problem 
 ON incident.problem_id = problem.sys_id 
 AND incident.sourceinstance = problem.sourceinstance  ) Driver        
 LEFT OUTER JOIN
 humana_mdsdb.incident_final incident  
 ON incident.sys_id = Driver.sys_id 
  AND incident.sourceinstance = Driver.sourceinstance  
 INNER JOIN
 humana_mdsdb.change_request_final change_request 
  ON incident.caused_by = change_request.sys_id 
 AND incident.sourceinstance = change_request.sourceinstance 
AND incident.opened_at >  COALESCE(change_request.work_start,change_request.start_date, change_request.closed_at)  
LEFT OUTER JOIN
 humana_mdsdb.cmdb_ci_outage_final cmdb_ci_outage 
 ON incident.sys_id = cmdb_ci_outage.task_number 
 AND incident.sourceinstance = cmdb_ci_outage.sourceinstance  
 LEFT OUTER JOIN
humana_mdsdb.problem_final problem 
  ON incident.problem_id = problem.sys_id 
 AND incident.sourceinstance = problem.sourceinstance       
WHERE COALESCE((SELECT dimension_wh_code  FROM humana_mdwdb.d_lov_map  WHERE d_lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
AND d_lov_map.dimension_code = change_request.state  AND d_lov_map.source_id = change_request.sourceinstance), 'UNKNOWN') = 'CLOSED' 
union  all
select cmdb_ci_outage.sys_id AS row_id ,change_request.sourceinstance AS source_id,'N' AS within_application_incident_flag FROM
( SELECT  sys_id, sourceinstance,  CASE  WHEN cdctype = 'D' THEN 'Y'  ELSE 'N'  END soft_deleted_flag  FROM humana_mdsdb.cmdb_ci_outage_final    
 UNION
 SELECT  cmdb_ci_outage.sys_id , cmdb_ci_outage.sourceinstance , CASE  WHEN cmdb_ci_outage.cdctype = 'D' THEN 'Y'  ELSE 'N'  END soft_deleted_flag 
FROM humana_mdsdb.cmdb_ci_outage_final cmdb_ci_outage    
JOIN
humana_mdsdb.change_request_final change_request 
ON cmdb_ci_outage.task_number = change_request.sys_id 
AND cmdb_ci_outage.sourceinstance = change_request.sourceinstance 
AND cmdb_ci_outage.begin > COALESCE(change_request.work_start,change_request.start_date,  change_request.closed_at) ) Driver        
LEFT OUTER JOIN
humana_mdsdb.cmdb_ci_outage_final cmdb_ci_outage  
ON cmdb_ci_outage.sys_id = Driver.sys_id 
AND cmdb_ci_outage.sourceinstance = Driver.sourceinstance  
 INNER JOIN
humana_mdsdb.change_request_final change_request 
ON cmdb_ci_outage.task_number = change_request.sys_id AND cmdb_ci_outage.sourceinstance = change_request.sourceinstance 
 AND cmdb_ci_outage.begin > COALESCE(change_request.work_start, change_request.start_date,change_request.closed_at)      
 WHERE COALESCE((SELECT dimension_wh_code FROM humana_mdwdb.d_lov_map  WHERE d_lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
 AND d_lov_map.dimension_code = change_request.state  AND d_lov_map.source_id = change_request.sourceinstance), 'UNKNOWN') = 'CLOSED' ) SRC
 join
 humana_mdwdb.f_caused_by_change TRGT
 on SRC.row_id = TRGT.row_id and SRC.source_id=TRGT.source_id
where 
SRC.within_application_incident_flag <>TRGT.within_application_incident_flag)a
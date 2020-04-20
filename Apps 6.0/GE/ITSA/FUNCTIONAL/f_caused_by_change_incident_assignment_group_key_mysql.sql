SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.'
ELSE 'Data Matched' END AS Message
FROM (select count(*) as cnt 
from
(select COALESCE(cmdb_ci_outage.sys_id, incident.sys_id) AS row_id,change_request.sourceinstance AS source_id,COALESCE(CONCAT('GROUP', '~', incident.assignment_group), 'UNSPECIFIED') AS incident_assignment_group_id from
 ( SELECT sys_id, sourceinstance, CASE  WHEN cdctype = 'D' THEN 'Y'   ELSE 'N'  END soft_deleted_flag FROM ge_mdsdb.incident_final    
UNION
SELECT incident.sys_id , incident.sourceinstance ,  CASE  WHEN incident.cdctype = 'D' THEN 'Y'  ELSE 'N'  END soft_deleted_flag  FROM ge_mdsdb.incident_final incident    
JOIN  ge_mdsdb.change_request_final change_request 
 ON incident.caused_by = change_request.sys_id 
 AND incident.sourceinstance = change_request.sourceinstance 
 AND incident.opened_at >  COALESCE(change_request.work_start, change_request.start_date,  change_request.closed_at) 
 UNION
  SELECT incident.sys_id ,  incident.sourceinstance , CASE   WHEN incident.cdctype = 'D' THEN 'Y'   ELSE 'N'  END soft_deleted_flag 
 FROM ge_mdsdb.incident_final incident    
 JOIN
 ge_mdsdb.cmdb_ci_outage_final cmdb_ci_outage 
 ON incident.sys_id = cmdb_ci_outage.task_number 
 AND incident.sourceinstance = cmdb_ci_outage.sourceinstance 
  UNION
 SELECT
 incident.sys_id , incident.sourceinstance , CASE  WHEN incident.cdctype = 'D' THEN 'Y'  ELSE 'N'  END soft_deleted_flag 
  FROM  ge_mdsdb.incident_final incident    
 JOIN
 ge_mdsdb.problem_final problem 
 ON incident.problem_id = problem.sys_id 
 AND incident.sourceinstance = problem.sourceinstance  ) Driver        
 LEFT OUTER JOIN
 ge_mdsdb.incident_final incident  
 ON incident.sys_id = Driver.sys_id 
  AND incident.sourceinstance = Driver.sourceinstance  
 INNER JOIN
 ge_mdsdb.change_request_final change_request 
  ON incident.caused_by = change_request.sys_id 
 AND incident.sourceinstance = change_request.sourceinstance 
AND incident.opened_at >  COALESCE(change_request.work_start,change_request.start_date, change_request.closed_at)  
LEFT OUTER JOIN
 ge_mdsdb.cmdb_ci_outage_final cmdb_ci_outage 
 ON incident.sys_id = cmdb_ci_outage.task_number 
 AND incident.sourceinstance = cmdb_ci_outage.sourceinstance  
 LEFT OUTER JOIN
ge_mdsdb.problem_final problem 
  ON incident.problem_id = problem.sys_id 
 AND incident.sourceinstance = problem.sourceinstance       
WHERE COALESCE((SELECT dimension_wh_code  FROM ge_mdwdb.d_lov_map  WHERE d_lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
AND d_lov_map.dimension_code = change_request.state  AND d_lov_map.source_id = change_request.sourceinstance), 'UNKNOWN') = 'CLOSED' 
union  all
select cmdb_ci_outage.sys_id AS row_id ,change_request.sourceinstance AS source_id,'UNSPECIFIED' AS incident_assignment_group_id FROM
( SELECT  sys_id, sourceinstance,  CASE  WHEN cdctype = 'D' THEN 'Y'  ELSE 'N'  END soft_deleted_flag  FROM ge_mdsdb.cmdb_ci_outage_final    
 UNION
 SELECT  cmdb_ci_outage.sys_id , cmdb_ci_outage.sourceinstance , CASE  WHEN cmdb_ci_outage.cdctype = 'D' THEN 'Y'  ELSE 'N'  END soft_deleted_flag 
FROM ge_mdsdb.cmdb_ci_outage_final cmdb_ci_outage    
JOIN
ge_mdsdb.change_request_final change_request 
ON cmdb_ci_outage.task_number = change_request.sys_id 
AND cmdb_ci_outage.sourceinstance = change_request.sourceinstance 
AND cmdb_ci_outage.begin > COALESCE(change_request.work_start,change_request.start_date,  change_request.closed_at) ) Driver        
LEFT OUTER JOIN
ge_mdsdb.cmdb_ci_outage_final cmdb_ci_outage  
ON cmdb_ci_outage.sys_id = Driver.sys_id 
AND cmdb_ci_outage.sourceinstance = Driver.sourceinstance  
 INNER JOIN
ge_mdsdb.change_request_final change_request 
ON cmdb_ci_outage.task_number = change_request.sys_id AND cmdb_ci_outage.sourceinstance = change_request.sourceinstance 
 AND cmdb_ci_outage.begin > COALESCE(change_request.work_start, change_request.start_date,change_request.closed_at)      
 WHERE COALESCE((SELECT dimension_wh_code FROM ge_mdwdb.d_lov_map  WHERE d_lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
 AND d_lov_map.dimension_code = change_request.state  AND d_lov_map.source_id = change_request.sourceinstance), 'UNKNOWN') = 'CLOSED' ) SRC
 join
 ge_mdwdb.f_caused_by_change TRGT
 on SRC.row_id = TRGT.row_id and SRC.source_id=TRGT.source_id
 join
 ge_mdwdb.d_internal_organization LKP
 on SRC.incident_assignment_group_id=LKP.row_id and SRC.source_id  =LKP.source_id
where 
coalesce(LKP.row_key,case when  SRC.incident_assignment_group_id is null then 0 else -1 end) <>TRGT.incident_assignment_group_key)a
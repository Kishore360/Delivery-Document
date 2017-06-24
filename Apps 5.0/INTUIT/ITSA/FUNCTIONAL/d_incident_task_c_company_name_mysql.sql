SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
from intuit_mdsdb.u_incident_task_final src
join intuit_mdwdb.d_incident_task_c tgt on tgt.row_id = src.sys_id  AND tgt.source_id = src.sourceinstance 
where 'N' <> exclude_flag
or CONCAT('<a href=\"','https://intuit.service-now.com/nav_to.do?uri=','u_incident_task.do?sys_id=',src.sys_id,'\" target=\"_blank\">',src.number,'</a>') <> source_url
or u_inin_interaction_id<>inin_interaction_c_id;
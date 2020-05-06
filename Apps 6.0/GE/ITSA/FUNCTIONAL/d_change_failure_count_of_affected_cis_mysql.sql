SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_failure.count_of_affected_cis' ELSE 'SUCCESS' END as Message
from ge_mdsdb.change_request_final change_request  
left outer join
(SELECT  change_request.sys_id AS row_id,  change_request.sourceinstance AS source_id,  Count(Distinct(task_ci.ci_item)) AS count_of_ci_item    
 FROM ge_mdsdb.change_request_final change_request      
 LEFT OUTER JOIN
ge_mdsdb.task_ci_final task_ci 
 ON change_request.sys_id=task_ci.task 
 and change_request.sourceinstance=task_ci.sourceinstance    
 WHERE change_request.cdctype <> 'D'  and task_ci.cdctype <> 'D'    
 GROUP BY 1, 2 )t_count_of_affected_ci
ON change_request.sys_id=t_count_of_affected_ci.row_id 
 and change_request.sourceinstance=t_count_of_affected_ci.source_id  
join
ge_mdwdb.d_change_failure TRGT
on  change_request.sys_id=TRGT.row_id and change_request.sourceinstance=TRGT.source_id
where coalesce(t_count_of_affected_ci.count_of_ci_item,0) <>TRGT.count_of_affected_cis
SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.source_url' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdwdb.d_change_task  trgt
JOIN intuit_mdsdb.change_task_final src
ON trgt.source_id = src.sourceinstance and trgt.row_id = src.sys_id
where CONCAT('<a href=\"','https://intuit.service-now.com/nav_to.do?uri=','change_task.do?sys_id=',src.sys_id,'\" target=\"_blank\">',src.number,'</a>')
<>
 trgt.source_url;
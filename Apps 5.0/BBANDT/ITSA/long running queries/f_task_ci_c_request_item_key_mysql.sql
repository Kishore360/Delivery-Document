SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_ci_c.request_item_key' ELSE 'SUCCESS' END as Message 
-- select distinct coalesce(lkp.row_key,case when SRC.task is NULL then 0 else -1 end), TRGT.request_item_key,lkp.dw_updated_on,TRGT.dw_updated_on
FROM bbandt_mdsdb.task_ci_final SRC 
LEFT OUTER JOIN bbandt_mdsdb.task_final task 
                    ON task.sourceinstance=SRC.sourceinstance 
                    AND task.sys_id=SRC.task  
JOIN bbandt_mdwdb.f_task_ci_c TRGT 
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
left join bbandt_mdwdb.d_request_item lkp
on SRC.task=lkp.row_id and SRC.sourceinstance = lkp.source_id
WHERE coalesce(lkp.row_key,case when SRC.task is NULL then 0 else -1 end) <> TRGT.request_item_key
and SRC.cdctype='X' and SRC.CDCTYPE='X' and task.cdctype='X';

/*long running query*/
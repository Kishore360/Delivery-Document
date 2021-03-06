
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for F_task_sla.task_number_c    ' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdwdb.f_task_sla trgt
RIGHT JOIN molinahealth_mdsdb.task_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_task lkp
ON src.task = lkp.row_id AND src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.task_number,'UNSPECIFIED') <> coalesce(task_number_c,' ')
;
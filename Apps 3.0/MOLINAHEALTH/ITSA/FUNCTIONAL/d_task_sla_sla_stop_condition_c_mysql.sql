
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.sla_stop_condition_c   ' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdwdb.d_task_sla trgt
RIGHT JOIN molinahealth_mdsdb.contract_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE SUBSTRING(src.stop_condition,1,255) <> coalesce(sla_stop_condition_c ,' ')
;

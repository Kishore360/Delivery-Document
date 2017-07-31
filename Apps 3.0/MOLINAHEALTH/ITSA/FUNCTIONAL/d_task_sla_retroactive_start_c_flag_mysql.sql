
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.retroactive_start_c_flag ' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdwdb.d_task_sla trgt
RIGHT JOIN molinahealth_mdsdb.contract_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE IF(retroactive=TRUE,'Y','N') <> coalesce(retroactive_start_c_flag,' ')
;
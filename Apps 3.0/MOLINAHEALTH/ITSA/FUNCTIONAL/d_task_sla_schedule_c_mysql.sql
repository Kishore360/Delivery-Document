
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.schedule_c  ' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdwdb.d_task_sla trgt
RIGHT JOIN molinahealth_mdsdb.contract_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdsdb.cmn_schedule_final sch1 
ON   src.schedule = sch1.sys_id AND src.sourceinstance = sch1.sourceinstance
WHERE COALESCE(sch1.name,'UNSPECIFIED') <> coalesce(schedule_c ,'UNSPECIFIED')
;
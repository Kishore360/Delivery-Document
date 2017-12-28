SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task_sla.type_c' ELSE 'SUCCESS' END as Message 
FROM (SELECT Count(1) as CNT
FROM svb_mdsdb.contract_sla_final src
join svb_mdwdb.d_task_sla trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where  coalesce(src.type, 'UNSPECIFIED') <> trgt.type_c
)temp;

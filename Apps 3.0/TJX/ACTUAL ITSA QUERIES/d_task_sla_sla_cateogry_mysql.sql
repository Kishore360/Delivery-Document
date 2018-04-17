SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
	CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.sla_category' ELSE 'SUCCESS' END as Message 
FROM tjx_mdsdb.contract_sla_final src
join tjx_mdwdb.d_task_sla trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE 
CASE WHEN LOWER(src.name) LIKE '%resolution%' OR LOWER(src.name) LIKE '%complete%' OR LOWER(src.name) LIKE '%close%'  THEN  'Resolution'  
	 WHEN LOWER(src.name) LIKE '%response%' OR LOWER(src.name) LIKE '%initiation%' OR LOWER(src.name) LIKE '%acknowledge%' THEN 'Response' 
	 ELSE NULL END <> trgt.sla_category ;
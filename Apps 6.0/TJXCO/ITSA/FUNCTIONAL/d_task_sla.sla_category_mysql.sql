SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
	CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_task_sla.sla_category' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from tjxco_mdsdb.contract_sla_final src
join tjxco_mdwdb.d_task_sla trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE 
CASE WHEN LOWER(src.name) LIKE '%resolution%' OR LOWER(src.name) LIKE '%complete%' OR LOWER(src.name) LIKE '%close%'
 OR LOWER(src.name) LIKE '%closure%'  THEN  'Resolution'  
	 WHEN LOWER(src.name) LIKE '%response%' OR LOWER(src.name) LIKE '%initiation%' OR LOWER(src.name) LIKE '%acknowledge%' 
     OR LOWER(src.name) LIKE '%ownership%' THEN 'Response' 
     WHEN lower(src.name) LIKE '%approval%' OR LOWER(src.name) LIKE '%review%' THEN 'Approval'
	 ELSE NULL END <> trgt.sla_category) temp ;
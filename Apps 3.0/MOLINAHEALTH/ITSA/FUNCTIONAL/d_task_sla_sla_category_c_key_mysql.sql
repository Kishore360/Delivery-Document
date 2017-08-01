
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.sla_category_c_key     ' ELSE 'SUCCESS' END as Message 
(
SELECT lkp.dimension_class,lkp.dimension_name,src.name,COALESCE(lkp.row_key, CASE WHEN src.name IS NULL THEN 0 ELSE -1 end) , coalesce(sla_category_c_key,0)
FROM molinahealth_mdwdb.d_task_sla trgt
RIGHT JOIN molinahealth_mdsdb.contract_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_lov lkp
ON  lkp.dimension_class = 'NAME~TASK_SLA' AND locate(lkp.dimension_code,src.name) <> 0 
WHERE COALESCE(lkp.row_key, CASE WHEN src.name IS NULL THEN 0 ELSE -1 end)<>  coalesce(sla_category_c_key,0)
;
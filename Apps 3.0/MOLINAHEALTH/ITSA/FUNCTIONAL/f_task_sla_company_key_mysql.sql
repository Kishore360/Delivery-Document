
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.company_key     ' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdwdb.f_task_sla trgt
RIGHT JOIN molinahealth_mdsdb.task_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
 JOIN (SELECT *,CONCAT('SUBSIDIARY~',company) as jn1 FROM  molinahealth_mdsdb.task_final) lkp
ON src.sys_id = lkp.sys_id AND src.sourceinstance = lkp.sourceinstance
LEFT JOIN molinahealth_mdwdb.d_internal_organization lkp2
ON lkp.jn1 = lkp2.row_id AND lkp.sourceinstance = lkp2.source_id
WHERE COALESCE(lkp2.row_key, CASE WHEN lkp.jn1 IS NULL THEN 0 ELSE -1 end) <> (company_key)
;
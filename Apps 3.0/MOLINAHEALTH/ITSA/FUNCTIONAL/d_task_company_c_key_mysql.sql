
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.company_key     ' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdwdb.d_task trgt
RIGHT JOIN molinahealth_mdsdb.task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN (SELECT *,CONCAT('SUBSIDIARY~',tk.company) as jn1 FROM  molinahealth_mdsdb.task_final) lkp
ON src.task = lkp.sys_id AND src.sourceinstance = lkp.sourceinstance
LEFT JOIN molinahealth_mdsdb.d_internal_organization lkp2
ON lkp.jn1 = lkp2.row_id AND lkp.sourceinstance = lkp2.source_id
WHERE COALESCE(lkp2.row_key, CASE WHEN lkp.jn1 IS NULL THEN 0 ELSE -1 end) <> (company_c_key)
;



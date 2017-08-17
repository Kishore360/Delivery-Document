
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.vendor_c_key     ' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdwdb.d_task_sla trgt
RIGHT JOIN molinahealth_mdsdb.contract_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_internal_organization lkp
ON COALESCE(CONCAT('SUBSIDIARY~',src.vendor),'UNSPECIFIED') = lkp.row_id
WHERE COALESCE(lkp.row_key, CASE WHEN src.vendor IS NULL THEN 0 ELSE -1 end) <> coalesce(vendor_c_key,' ')
;
select
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for ds_application_c.ci_organization_name_c_key' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT
FROM  nbcu_mdsdb.cmdb_ci_appl_final SRC
LEFT JOIN nbcu_mdwdb.d_internal_contact SRC1 
ON (coalesce(concat('INTERNAL_CONTACT','~',SRC.u_executive_sponsor),'UNSPECIFIED')=SRC1.row_id AND SRC.sourceinstance=SRC1.source_id)
JOIN nbcu_mdwdb.d_application_c TRGT
ON (concat('APPLICATION','~',SRC.sys_id)= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)  and TRGT.soft_deleted_flag <>'Y'
 WHERE COALESCE(SRC1.row_key, CASE WHEN SRC.u_executive_sponsor IS NULL THEN 0 ELSE -1 END)
  <>TRGT.organization_name_c_key
)temp;
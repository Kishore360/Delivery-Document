SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_application.application_managed_by_c_key' ELSE 'SUCCESS' END as Message
FROM rogersdev6_mdsdb.cmdb_ci_appl_final SRC
left JOIN rogersdev6_mdwdb.d_application TRGT
ON (concat('APPLICATION~',ifnull(SRC.sys_id,'')) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
LEFT JOIN rogersdev6_mdwdb.d_internal_contact LKP ON COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.managed_by),'UNSPECIFIED')=LKP.row_id
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,case when SRC.managed_by is null then 0 else -1 end)<> (TRGT.application_managed_by_c_key);
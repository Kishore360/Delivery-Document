SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_service.service_owner_c_key' ELSE 'SUCCESS' END as Message
FROM rogers6_mdsdb.cmdb_ci_service_final SRC
left JOIN rogers6_mdwdb.d_service TRGT
ON (CONCAT('BUSINESS_SERVICE','~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
LEFT JOIN rogers6_mdwdb.d_internal_contact LKP ON COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_service_owner),'UNSPECIFIED')=LKP.row_id
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,case when SRC.u_service_owner is null then 0 else -1 end)<> (TRGT.service_owner_c_key);
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.business_service_operational_status_c_key' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.cmdb_ci_service_final SRC
JOIN  fidelity_mdwdb.d_service TRGT
ON (CONCAT('BUSINESS_SERVICE','~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
join fidelity_mdwdb.d_lov LKP
on coalesce(upper(concat('OPERATIONAL_STATUS_C~business_service~',SRC.operational_status)),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.operational_status is null then 0 else -1 end) <>TRGT.business_service_operational_status_c_key; 

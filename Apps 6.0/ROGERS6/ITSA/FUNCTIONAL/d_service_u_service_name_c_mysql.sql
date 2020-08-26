SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_service.u_service_name_c' ELSE 'SUCCESS' END as Message
FROM rogers6_mdsdb.cmdb_ci_service_final SRC
left JOIN rogers6_mdwdb.d_service TRGT
ON (CONCAT('BUSINESS_SERVICE','~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
WHERE COALESCE(u_service_name,'UNSPECIFIED')<> (TRGT.u_service_name_c);
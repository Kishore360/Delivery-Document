
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.number_c' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.cmdb_ci_service_final SRC
JOIN  fidelity_mdwdb.d_service TRGT
ON (CONCAT('BUSINESS_SERVICE','~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE coalesce(SRC.u_number,'UNSPECIFIED') <>TRGT.number_c; 
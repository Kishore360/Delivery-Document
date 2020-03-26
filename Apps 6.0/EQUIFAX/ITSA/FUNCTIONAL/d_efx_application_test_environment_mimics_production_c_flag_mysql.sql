SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_efx_application_c.test_environment_mimics_production_c_flag' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.u_efx_application_final SRC
JOIN equifax_mdwdb.d_efx_application_c TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
WHERE case when SRC.u_test_environment_mimics_production= 1 then 'Y' else 'N' end<> TRGT.test_environment_mimics_production_c_flag and SRC.cdctype<>'D'

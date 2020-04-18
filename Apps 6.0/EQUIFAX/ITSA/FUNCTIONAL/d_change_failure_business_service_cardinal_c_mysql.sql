SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.business_service_cardinal_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
LEFT OUTER JOIN
equifax_mdsdb.cmdb_ci_service_final business_service 
ON SRC.business_service=business_service.sys_id 
and SRC.sourceinstance=business_service.sourceinstance
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
LEFT JOIN equifax_mdsdb.us_predictor_variable_c_final LKP
ON CASE 
                    WHEN SRC.business_service is null 
                    or business_service.name is null then 'UNSPECIFIED'  
                    WHEN business_service.sys_id is null then 'UNKNOWN' 
                    else business_service.name 
                end =LKP.value and TRGT.source_id=LKP.sourceinstance and LKP.predictor_variable='business_service'
WHERE CASE WHEN LKP.value is null then TRGT.business_service else 'OTHERS' end <>business_service_cardinal_c and SRC.cdctype<>'D'

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.ci_manufacturer_cardinal_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
LEFT JOIN equifax_mdsdb.us_predictor_variable_c_final LKP
ON TRGT.ci_manufacturer_c=LKP.value and TRGT.source_id=LKP.sourceinstance and LKP.predictor_variable='manufacturer'
WHERE CASE WHEN LKP.value is null then ci_manufacturer_c else 'OTHERS' end <>ci_manufacturer_cardinal_c and SRC.cdctype<>'D';

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.requestor_group_name_cardinal_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
LEFT JOIN equifax_mdsdb.us_predictor_variable_c_final LKP
ON REPLACE(REPLACE(REPLACE(TRGT.requestor_group_name_c,'_DO NOT USE GROUP',''),'_DONOTUSE',''),'_DONOT USE','')=REPLACE(REPLACE(REPLACE(value,'_DO NOT USE GROUP',''),'_DONOTUSE',''),'_DONOT USE','') and TRGT.source_id=LKP.sourceinstance and LKP.predictor_variable='requestor_group_name'
WHERE CASE WHEN LKP.value is null then TRGT.requestor_group_name_c else 'OTHERS' end <>requestor_group_name_cardinal_c

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.record_producer_cardinal_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
LEFT JOIN (select * from equifax_mdsdb.us_predictor_variable_c_final where cdctype<>'D')LKP
ON TRGT.record_producer_name_c=LKP.value and TRGT.source_id=LKP.sourceinstance and LKP.predictor_variable='record_producer_c'
WHERE CASE WHEN LKP.value is null then TRGT.record_producer_name_c else 'OTHERS' end <>record_producer_cardinal_c and SRC.cdctype<>'D';


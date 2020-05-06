SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.change_risk' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
LEFT JOIN (select value, sourceinstance, label from equifax_mdsdb.sys_choice_final
where name='change_request' and element = 'risk' ) ch1
on SRC.risk=ch1.value and SRC.sourceinstance=ch1.sourceinstance 
WHERE CASE WHEN ch1.value is null then 'UNKNOWN' when SRC.risk is null then 'UNSPECIFIED' else ch1.label end<>TRGT.change_risk and SRC.cdctype<>'D';

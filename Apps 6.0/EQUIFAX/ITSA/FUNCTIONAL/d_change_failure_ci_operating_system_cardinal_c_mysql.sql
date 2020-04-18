SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.ci_operating_system_cardinal_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
LEFT OUTER JOIN
equifax_mdsdb.cmdb_ci_final cmdb_ci 
ON SRC.cmdb_ci=cmdb_ci.sys_id 
and SRC.sourceinstance=cmdb_ci.sourceinstance 
LEFT OUTER JOIN
equifax_mdsdb.cmdb_ci_computer_final cmdb_ci_computer 
ON cmdb_ci.sys_id=cmdb_ci_computer.sys_id 
and cmdb_ci.sourceinstance=cmdb_ci.sourceinstance 
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
LEFT JOIN equifax_mdsdb.us_predictor_variable_c_final LKP
ON CASE   WHEN SRC.cmdb_ci is null  or cmdb_ci_computer.os is null then 'UNSPECIFIED'  
WHEN cmdb_ci.sys_id is null then 'UNKNOWN'   else cmdb_ci_computer.os  end=LKP.value and TRGT.source_id=LKP.sourceinstance and LKP.predictor_variable='os'
WHERE CASE WHEN LKP.value is null then ci_operating_system_c else 'OTHERS' end <>ci_operating_system_cardinal_c and  SRC.cdctype<>'D'

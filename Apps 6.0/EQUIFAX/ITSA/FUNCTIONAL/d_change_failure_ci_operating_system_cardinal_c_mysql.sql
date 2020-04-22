SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.ci_operating_system_cardinal_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
left join (select row_id, sourceinstance as source_id, 
CASE WHEN predictor_variable='requestor_group_name' then REPLACE(REPLACE(REPLACE(value,'_DO NOT USE GROUP',''),'_DONOTUSE',''),'_DONOT USE','') else value end as value, predictor_variable
from equifax_mdsdb.us_predictor_variable_c_final
where cdctype<>'D'
) LKP
on TRGT.ci_operating_system_c=LKP.value and TRGT.source_id=LKP.source_id and LKP.predictor_variable='os'
WHERE CASE WHEN LKP.value is null then TRGT.ci_operating_system_c else 'OTHERS' end <>TRGT.ci_operating_system_cardinal_c and  SRC.cdctype<>'D'

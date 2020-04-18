SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.requestor_group_name_cardinal_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
 LEFT OUTER JOIN
equifax_mdsdb.sys_user_group_final sys_user_group1 
ON SRC.u_requester_group = sys_user_group1.sys_id 
and  SRC.sourceinstance = sys_user_group1.sourceinstance  
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
LEFT JOIN equifax_mdsdb.us_predictor_variable_c_final LKP
ON REPLACE(REPLACE(REPLACE((CASE  WHEN SRC.u_requester_group is null or sys_user_group1.name is null then 'UNSPECIFIED'  WHEN sys_user_group1.sys_id is null then 'UNKNOWN'  else sys_user_group1.name  end),'_DO NOT USE GROUP',''),'_DONOTUSE',''),'_DONOT USE','')=REPLACE(REPLACE(REPLACE(value,'_DO NOT USE GROUP',''),'_DONOTUSE',''),'_DONOT USE','') and TRGT.source_id=LKP.sourceinstance and LKP.predictor_variable='requestor_group_name'
WHERE CASE WHEN LKP.value is null then TRGT.requestor_group_name_c else 'OTHERS' end <>requestor_group_name_cardinal_c
and  SRC.cdctype<>'D'

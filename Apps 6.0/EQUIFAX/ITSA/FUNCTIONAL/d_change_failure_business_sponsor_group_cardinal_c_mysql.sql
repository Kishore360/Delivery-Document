SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.business_sponsor_group_cardinal_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
 LEFT OUTER JOIN
equifax_mdsdb.sys_user_group_final sponsor_group 
 ON SRC.u_business_sponsor_group = sponsor_group.sys_id 
and  SRC.sourceinstance = sponsor_group.sourceinstance
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
LEFT JOIN equifax_mdsdb.us_predictor_variable_c_final LKP
ON REPLACE(REPLACE(REPLACE((CASE 
                    WHEN SRC.u_business_sponsor_group is null 
                    or  sponsor_group.name is null then 'UNSPECIFIED' 
                    WHEN sponsor_group.sys_id is null then 'UNKNOWN' 
                    else sponsor_group.name 
                end),'_DO NOT USE GROUP',''),'_DONOTUSE',''),'_DONOT USE','')=REPLACE(REPLACE(REPLACE(value,'_DO NOT USE GROUP',''),'_DONOTUSE',''),'_DONOT USE','') and TRGT.source_id=LKP.sourceinstance and LKP.predictor_variable='business_sponsor_group_c'
WHERE CASE WHEN LKP.value is null then TRGT.business_sponsor_group_name_c else 'OTHERS' end <>business_sponsor_group_cardinal_c and SRC.cdctype<>'D';

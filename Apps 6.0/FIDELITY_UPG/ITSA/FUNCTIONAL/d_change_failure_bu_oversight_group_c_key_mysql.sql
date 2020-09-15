SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_outage.audience_outage_c_key' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN fidelity_mdwdb.d_internal_organization LKP 
ON ( COALESCE(CONCAT('GROUP~',SRC.u_bu_oversight_group),'UNSPECIFIED')= LKP.row_id AND SRC.sourceinstance = LKP.source_id ) and LKP.group_flag='Y' 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_bu_oversight_group IS NULL THEN 0 else -1 end)<> (TRGT.bu_oversight_group_c_key)  and (
coalesce(SRC.work_start,SRC.start_date,SRC.closed_at)>'2019-01-01'
and SRC.u_environment='Production'
and TRGT.current_flag='Y'
and SRC.cdctype<>'D') ) temp;

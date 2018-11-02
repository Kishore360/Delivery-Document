SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.change_request_final  SRC 
join 
fidelity_mdsdb.sys_user_group_final SRC1 
ON SRC.u_bu_oversight_group=SRC1.sys_id
JOIN fidelity_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE COALESCE(SRC1.name,'UNSPECIFIED') <> (TRGT.oversight_group_name) 

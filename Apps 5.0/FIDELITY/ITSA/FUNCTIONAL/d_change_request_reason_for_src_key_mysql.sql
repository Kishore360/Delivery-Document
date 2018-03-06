SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.change_environment_src_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.change_request_final src
JOIN fidelity_mdwdb.d_change_request trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN fidelity_mdwdb.d_lov lkp
ON COALESCE(CONCAT('u_reason_for_change~CHANGE_REQUEST~~~',src.u_reason_for_change),'UNSPECIFIED') =lkp.row_id 
where COALESCE(lkp.row_key,CASE WHEN src.u_reason_for_change IS NULL THEN 0 else -1 end)<> trgt.change_environment_src_c_key
;




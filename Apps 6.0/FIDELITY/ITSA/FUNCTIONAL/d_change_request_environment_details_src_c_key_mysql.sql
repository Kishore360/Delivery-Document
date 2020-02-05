SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.environment_details_src_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.change_request_final src
JOIN fidelity_mdwdb.d_change_request trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN fidelity_mdwdb.d_lov lkp
ON COALESCE(CONCAT('U_ENVIRONMENT_DETAILS~CHANGE_REQUEST~',src.u_environment_details ),'UNSPECIFIED') =lkp.row_id 
and lkp.source_id=src.sourceinstance and lkp.dimension_class='U_ENVIRONMENT_DETAILS~CHANGE_REQUEST'
where COALESCE(lkp.row_key,CASE WHEN src.u_environment_details  IS NULL THEN 0 else -1 end)<> trgt.environment_details_src_c_key and SRC.cdctype<>'D'
;


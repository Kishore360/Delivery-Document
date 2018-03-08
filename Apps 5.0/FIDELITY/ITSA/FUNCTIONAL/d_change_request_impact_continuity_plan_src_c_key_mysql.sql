SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.impact_continuity_plan_src_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.change_request_final src
JOIN fidelity_mdwdb.d_change_request trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN fidelity_mdwdb.d_lov lkp
ON COALESCE(CONCAT('IMPACT~CHANGE_REQUEST~~~',src.u_impact_continuity_plan ),'UNSPECIFIED') =lkp.row_id 
where COALESCE(lkp.row_key,CASE WHEN src.u_impact_continuity_plan  IS NULL THEN 0 else -1 end)<> trgt.impact_continuity_plan_src_c_key
;


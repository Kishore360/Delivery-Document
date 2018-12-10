SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.reason_src_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.sys_user_final src
JOIN fidelity_mdwdb.d_internal_contact trgt
on concat('INTERNAL_CONTACT~',src.sys_id) = trgt.row_id and src.sourceinstance = trgt.source_id
where COALESCE(src.u_classification,'UNSPECIFIED')<> trgt.u_classification_c
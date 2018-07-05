SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.employee_review_state_src_c_key' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_employee_review_c trgt
RIGHT JOIN wow_mdsdb.u_employee_review_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN wow_mdwdb.d_lov lkp
ON COALESCE(CONCAT('STATE_C~EMPLOYEE_REVIEW_C~~~',src.u_state),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_state IS NULL THEN 0 else -1 end)<> trgt.employee_review_state_src_c_key
;
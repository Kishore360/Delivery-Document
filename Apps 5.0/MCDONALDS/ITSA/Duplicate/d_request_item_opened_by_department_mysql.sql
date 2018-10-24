SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message FROM 
mcdonalds_mdsdb.sc_req_item_final SRC
left join mcdonalds_mdsdb.sys_user_final scu on SRC.opened_by = scu.sys_id
LEFT JOIN mcdonalds_mdwdb.d_request_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
left join mcdonalds_mdwdb.d_internal_organization LKP on LKP.row_id =concat('DEPARTMENT~',scu.department) and SRC.sourceinstance=LKP.source_id
where LKP.organization_name<>opened_by_department;


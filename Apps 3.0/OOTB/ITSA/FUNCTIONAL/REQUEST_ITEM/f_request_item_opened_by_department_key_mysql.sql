 SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request.priority_escalated_flag' ELSE 'SUCCESS' END as Message from
FROM (SELECT count(1) as CNT 
<<tenant>>_mdsdb.sc_req_item_final SRC
left join <<tenant>>_mdsdb.sys_user_final scu
on SRC.opened_by = scu.sys_id

LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id

left join <<tenant>>_mdwdb.d_internal_organization LKP on LKP.row_id =concat('DEPARTMENT~',scu.department) and SRC.sourceinstance=LKP.source_id
 AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to 

WHERE COALESCE(LKP.row_key ,CASE WHEN scu.department is null THEN 0 else -1 end)<> (TRGT.opened_by_department_key))temp;

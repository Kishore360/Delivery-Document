 SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request.priority_escalated_flag' ELSE 'SUCCESS' END as Message from
 (SELECT count(1) as CNT FROM
tjx_mdsdb.sc_req_item_final SRC
left join tjx_mdsdb.sys_user_final scu
on SRC.opened_by = scu.sys_id

LEFT JOIN tjx_mdwdb.f_request_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id

left join tjx_mdwdb.d_internal_organization LKP on LKP.row_id =concat('DEPARTMENT~',scu.department) and SRC.sourceinstance=LKP.source_id
 AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to 

 join tjx_mdwdb.d_request_item a19 on (TRGT.request_item_key = a19.row_key)  where category_name_c in ('ARMS') and COALESCE(LKP.row_key ,CASE WHEN scu.department is null THEN 0 else -1 end)<> (TRGT.opened_by_department_key))temp;

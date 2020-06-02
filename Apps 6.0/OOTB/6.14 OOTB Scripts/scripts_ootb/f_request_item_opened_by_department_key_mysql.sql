 SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request.priority_escalated_flag' ELSE 'SUCCESS' END as Message from
 (SELECT count(1) as CNT FROM
#MDS_TABLE_SCHEMA.sc_req_item_final SRC
left join #MDS_TABLE_SCHEMA.sys_user_final scu
on SRC.opened_by = scu.sys_id

LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id

left join #DWH_TABLE_SCHEMA.d_internal_organization LKP on LKP.row_id =concat('DEPARTMENT~',scu.department) and SRC.sourceinstance=LKP.source_id
 AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to 

WHERE COALESCE(LKP.row_key ,CASE WHEN scu.department is null THEN 0 else -1 end)<> (TRGT.opened_by_department_key))temp;

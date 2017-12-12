SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_request_item_opened_by_department_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT 
FROM asu_mdsdb.sc_req_item_final SRC
LEFT JOIN asu_mdsdb.sys_user_final SCU ON (SRC.opened_by=SCU.sys_id)
LEFT JOIN asu_mdwdb.f_request_item TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN asu_mdwdb.d_internal_organization LKP ON LKP.row_id = concat('DEPARTMENT~',SCU.department) and SRC.sourceinstance=LKP.source_id
AND TRGT.pivot_date BETWEEN LKP.effective_from AND LKP.effective_to
WHERE COALESCE(LKP.row_key,CASE WHEN SCU.department is NULL THEN 0 ELSE -1 END)<>(TRGT.opened_by_department_key))temp;
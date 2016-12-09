 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.opened_by_department_key' ELSE 'SUCCESS' END as Message from
rei_mdsdb.sc_req_item_final SRC
LEFT JOIN rei_mdwdb.f_request_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
left join  rei_mdwdb.d_internal_contact scu on COALESCE(concat('INTERNAL_CONTACT~',SRC.opened_by),'UNSPECIFIED') = scu.row_id AND SRC.sourceinstance= scu.source_id AND TRGT.pivot_date
 BETWEEN scu.effective_from AND scu.effective_to
left join rei_mdwdb.d_internal_organization LKP on LKP.row_id =concat('DEPARTMENT~',scu.department_code) and scu.source_id=LKP.source_id
 AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to 
WHERE COALESCE(LKP.row_key ,CASE WHEN scu.department_code is null THEN 0 else -1 end)<> (TRGT.opened_by_department_key)
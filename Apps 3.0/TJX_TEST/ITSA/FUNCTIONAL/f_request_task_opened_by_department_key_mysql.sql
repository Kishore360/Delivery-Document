

select 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_by_department_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as CNT
 
 
 FROM tjx_mdsdb.sc_task_final SRC 
 JOIN tjx_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN  tjx_mdwdb.d_internal_contact LKP1 
 ON ( concat('INTERNAL_CONTACT~',SRC.opened_by)= LKP1.row_id 
 AND SRC.sourceinstance= LKP1.source_id )
 
 LEFT JOIN   tjx_mdwdb.d_internal_organization LKP
 ON ( concat('DEPARTMENT~',LKP1.department_code)= LKP.row_id 
 AND LKP1.source_id= LKP.source_id )

JOIN   tjx_mdwdb.d_internal_organization LKP2
 ON ( concat('DEPARTMENT~',SRC.opened_by)= LKP2.row_id 
 AND SRC.sourceinstance= LKP2.source_id )
 and LKP.row_id  is null 
 
  JOIN  tjx_mdwdb.f_request_task a11 on  (a11.request_item_key = TRGT.row_key)
join tjx_mdwdb.d_request_item a19 
on (a11.request_item_key = a19.row_key) 
 WHERE category_name_c in ('ARMS') and COALESCE(LKP.row_key,LKP2.row_key,CASE WHEN (SRC.opened_by is not null and LKP1.department_code IS NULL 
 or SRC.opened_by is  null) THEN 0 else -1 end)<> (TRGT.opened_by_department_key))temp;
  

SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_task_ci_c.sys_class_name_c' ELSE 'SUCCESS' END as Message
FROM 
(select count(1)  as cnt FROM 
equifax_mdsdb.task_ci_final SRC  
join equifax_mdsdb.incident_final            SRC1 on SRC.task=SRC1.sys_id and SRC.sourceinstance=SRC1.sourceinstance
JOIN equifax_mdsdb.change_request_final SRC2 on SRC.task=SRC2.sys_id and SRC.sourceinstance=SRC2.sourceinstance
join equifax_mdsdb.sc_request_final     SRC3 on SRC.task=SRC3.sys_id and SRC.sourceinstance=SRC3.sourceinstance
join equifax_mdsdb.problem_final        SRC4 on SRC.task=SRC4.sys_id and SRC.sourceinstance=SRC4.sourceinstance
join equifax_mdsdb.sc_req_item_final    SRC5 on SRC.task=SRC5.sys_id and SRC.sourceinstance=SRC5.sourceinstance
join equifax_mdsdb.sc_task_final        SRC6 on SRC.task=SRC6.sys_id and SRC.sourceinstance=SRC6.sourceinstance
join equifax_mdwdb.d_task_ci_c          TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where  
(CASE when  SRC.task=SRC1.sys_id THEN SRC1.sys_class_name 
when SRC.task=SRC2.sys_id THEN SRC2.sys_class_name  
when SRC.task=SRC3.sys_id THEN SRC3.sys_class_name  
when SRC.task=SRC4.sys_id THEN SRC4.sys_class_name  
when SRC.task=SRC5.sys_id THEN SRC5.sys_class_name  	
when SRC.task=SRC6.sys_id THEN SRC6.sys_class_name else  'others' END) and SRC.cdctype<>'D' <>TRGT.sys_class_name_c 
)temp;
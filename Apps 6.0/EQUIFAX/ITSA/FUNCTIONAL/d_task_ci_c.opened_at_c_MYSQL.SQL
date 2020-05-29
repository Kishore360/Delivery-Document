SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_task_ci_c.opened_at_c' ELSE 'SUCCESS' END as Message
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
coalesce(coalesce(SRC1.opened_at,SRC1.sys_created_on),coalesce(SRC2.opened_at,SRC2.sys_created_on),
coalesce(SRC3.opened_at,SRC3.sys_created_on),coalesce(SRC4.opened_at,SRC4.sys_created_on),
coalesce(SRC5.opened_at,SRC5.sys_created_on),coalesce(SRC6.opened_at,SRC.sys_created_on),'')
 and SRC.cdctype<>'D'<>TRGT.opened_at_c and SRC.cdctype<>'D'
)temp;












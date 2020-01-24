SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.task_final SRC
join mercury_mdsdb.sc_req_item_final SRC1 
on SRC1.sys_id=SRC.sys_id and SRC1.sourceinstance=SRC.sourceinstance  
left join 
(select SRC1.sys_id,SRC1.sourceinstance,SRC1.cat_item from mercury_mdsdb.sc_req_item_final SRC1 
join mercury_mdsdb.sc_task_final SRC12 
on SRC1.sys_id=SRC12.request_item and SRC1.sourceinstance=SRC12.sourceinstance )a  on SRC1.sys_id=a.sys_id and SRC1.sourceinstance=a.sourceinstance
JOIN mercury_mdwdb.f_task_c TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join mercury_mdwdb.d_master_item LKP
on coalesce(SRC1.cat_item,a.cat_item)=LKP.row_id
WHERE SRC.sys_class_name in ('CHANGE_REQUEST','PROBLEM','CHANGE_TASK','PROBLEM_TASK','em_ci_severity_task','FACILITIES','HR_CASE',
'KB_SUBMISSION','PM_PROJECT','PM_PROJECT_TASK','RM_DEFECT','sn_customerservice_case','SYSAPPROVAL_GROUP','TASK','INCIDENT',
'TICKET','U_ASC_TICKET','U_INCIDENT_TASK','U_PROBLEM_TASK','U_SHIFT_TURNOVER_REPORT','VTB_TASK','sc_task','sc_req_item','sc_request') 
and coalesce(LKP.row_key,case when coalesce(SRC1.cat_item,a.cat_item) is null then  0 else -1 end )<>TRGT.catalog_item_key
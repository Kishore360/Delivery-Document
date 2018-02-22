SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'Data Matched' END as Message
FROM 
(SELECT Count(1) as CNT 
from nbcu_mdsdb.task_final a
join nbcu_mdwdb.d_task b on (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
where 
CASE 
WHEN a.sys_class_name='change_task' THEN 'Change Task' 
WHEN a.sys_class_name='incident' THEN 'Incident' 
WHEN a.sys_class_name='sc_req_item' THEN 'Requested Item'
WHEN a.sys_class_name='sc_request' THEN 'Request'
WHEN a.sys_class_name='sc_task' THEN 'Catalog Task'
WHEN a.sys_class_name='sysapproval_group' THEN 'Group approval'
WHEN a.sys_class_name='change_request' THEN 'Change Request'
WHEN a.sys_class_name='rm_defect' THEN 'Defect'
WHEN a.sys_class_name='pm_project_task' THEN 'Project Task'
WHEN a.sys_class_name='rm_enhancement' THEN 'Enhancement'
WHEN a.sys_class_name='rm_release_scrum' THEN 'Scrum release'
WHEN a.sys_class_name='pm_project' THEN 'Project'
WHEN a.sys_class_name='vtb_task' THEN 'Private Task'
WHEN a.sys_class_name='kb_submission' THEN 'Kb Submission'
WHEN a.sys_class_name='rm_story' THEN 'Story'
WHEN a.sys_class_name='rm_sprint' THEN 'Sprint'
WHEN a.sys_class_name='u_ridac' THEN 'Ridac'
WHEN a.sys_class_name='release_task' THEN 'Feature Task'
WHEN a.sys_class_name='problem_task' THEN 'Problem Task'
WHEN a.sys_class_name='rm_doc' THEN 'Documentation Task'
WHEN a.sys_class_name='u_pm_program' THEN 'Program'
WHEN a.sys_class_name='rm_scrum_task' THEN 'Scrum task'
WHEN a.sys_class_name='rm_test' THEN 'Testing Task'
WHEN a.sys_class_name='rm_epic' THEN 'Epic'
WHEN a.sys_class_name='rm_product' THEN 'Product'
WHEN a.sys_class_name='x_xma_xmatters_engage_with_xmatters' THEN 'Initiate xMatters'
WHEN a.sys_class_name='facilities_request' THEN 'Facilities Request'
WHEN a.sys_class_name='facilities_request_task' THEN 'Facilities Request Task'
WHEN a.sys_class_name='u_tlmd_bcst_incident' THEN 'TLMD Broadcast Incident'
WHEN a.sys_class_name='u_shoot' THEN 'Shoot'
END <> b.task_type 
) a; 

 


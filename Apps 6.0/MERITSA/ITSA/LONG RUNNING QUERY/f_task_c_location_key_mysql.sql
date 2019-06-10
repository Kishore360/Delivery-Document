create index task_fin_index on mercuryins_mdsdb.task_final (sys_id,sourceinstance); -- ,assignment_group,sys_class_name: 18 sec
create index task_db_index on mercuryins_mdwdb.f_task (row_id,source_id); -- ,assignment_group_c_key : 34 sec
create index contact_org_index on mercuryins_mdwdb.d_location (row_id,source_id); -- ,row_key 0.09 sec

select CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 'MDS to DWH data validation failed for f_task_c.location_key' ELSE 'SUCCESS' END as Message 
from (SELECT count(1) as cnt
FROM mercuryins_mdsdb.task_final SRC
JOIN mercuryins_mdwdb.f_task_c TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
join mercuryins_mdwdb.d_location LKP
on COALESCE(SRC.location,'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.source_id
WHERE 
SRC.sys_class_name in ('TICKET','INCIDENT','PROBLEM','PROBLEM_TASK','SC_REQ_ITEM','SC_TASK','SC_REQUEST','CHANGE_REQUEST'
,'CHANGE_TASK','U_INCIDENT_TASK',
'KB_SUBMISSION','U_SHIFT_TURNOVER_REPORT','HR_CASE','U_PROBLEM_TASK','U_ASC_TICKET','PM_PROJECT','SYSAPPROVAL_GROUP'
,'VTB_TASK','RM_DEFECT','FACILITIES','TASK') and
coalesce(LKP.row_key,case when SRC.location is null then  0 else -1 end )<> TRGT.location_key)a;
Drop index task_fin_index on mercuryins_mdsdb.task_final;
Drop index task_db_index on mercuryins_mdwdb.f_task;
Drop index contact_org_index on mercuryins_mdwdb.d_location;


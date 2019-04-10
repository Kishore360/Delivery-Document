
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
coalesce(LKP.row_key,case when SRC.location is null then  0 else -1 end )<> TRGT.location_key)a
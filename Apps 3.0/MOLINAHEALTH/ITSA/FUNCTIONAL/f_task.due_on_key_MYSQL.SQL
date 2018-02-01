
SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT  > 0 THEN 'MDS to DWH data validation failed for f_task.due_on_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) AS CNT 
FROM molinahealth_mdsdb.task_final SRC
LEFT JOIN molinahealth_mdwdb.d_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN molinahealth_mdwdb.f_incident INC ON (SRC.sys_id=INC.row_id AND SRC.sourceinstance=INC.source_id)
LEFT JOIN molinahealth_mdwdb.f_problem PR ON (SRC.sys_id=PR.row_id AND SRC.sourceinstance=PR.source_id)
-- LEFT JOIN molinahealth_mdwdb.f_request_item RT ON (SRC.sys_id=RT.row_id AND SRC.sourceinstance=RT.source_id)
LEFT JOIN molinahealth_mdwdb.f_change_request CR ON (SRC.sys_id=CR.row_id AND SRC.sourceinstance=CR.source_id)
LEFT JOIN molinahealth_mdwdb.f_hr_case_c HR ON (SRC.sys_id = HR.row_id AND SRC.sourceinstance=HR.source_id)
LEFT JOIN molinahealth_mdwdb.f_hr_task_c HT ON (SRC.sys_id=HT.row_id AND SRC.sourceinstance=HT.source_id)
LEFT JOIN molinahealth_mdwdb.f_request REQ ON (SRC.sys_id=REQ.row_id AND SRC.sourceinstance=REQ.source_id)
LEFT JOIN molinahealth_mdwdb.f_request_task REQTK ON (SRC.sys_id = REQTK.row_id AND SRC.sourceinstance=REQTK.source_id)
LEFT JOIN molinahealth_mdwdb.f_problem_task PRTK ON (SRC.sys_id = PRTK.row_id AND SRC.sourceinstance=PRTK.source_id)
JOIN molinahealth_mdwdb.f_task TG ON (TRGT.row_key=TG.task_key AND TRGT.source_id=TG.source_id)
JOIN molinahealth_mdwdb.d_calendar_date LKP ON (date_format(convert_tz(SRC.due_date,'GMT','America/Los_Angeles'),'%Y%m%d')LKP.row_id AND LKP.source_id=0)
WHERE 
COALESCE(INC.due_on_key,PR.due_on_key,
-- RT.due_on_key,
CR.due_on_key,
HR.due_on_key,
HT.due_on_key,
REQ.due_on_key,
REQTK.due_on_key,
PRTK.due_on_key,
0,
LKP.row_key,CASE WHEN SRC.due_date IS NULL THEN 0 ELSE -1 END)<> TG.due_on_key
) a; 


/* SELECT *
FROM molinahealth_mdsdb.task_final SRC 
LEFT JOIN molinahealth_mdsdb.incident_final inc ON (SRC.sys_id=inc.sys_id AND SRC.sourceinstance=inc.sourceinstance)
LEFT JOIN molinahealth_mdsdb.problem_final pr ON (SRC.sys_id=pr.sys_id AND SRC.sourceinstance=pr.sourceinstance)
LEFT JOIN molinahealth_mdsdb.problem_task_final pt ON (SRC.sys_id=pt.sys_id AND SRC.sourceinstance=pt.sourceinstance)
LEFT JOIN molinahealth_mdsdb.change_request_final cr ON (SRC.sys_id=cr.sys_id AND SRC.sourceinstance=cr.sourceinstance)
-- LEFT JOIN molinahealth_mdsdb.sc_cat_item_final ci ON (SRC.sys_id=ci.sys_id AND SRC.sourceinstance=ci.sourceinstance)
LEFT JOIN molinahealth_mdsdb.sc_task_final ct ON (SRC.sys_id=ct.sys_id AND SRC.sourceinstance=ct.sourceinstance)
LEFT JOIN molinahealth_mdsdb.sc_req_item_final rq ON (SRC.sys_id=rq.sys_id AND SRC.sourceinstance=rq.sourceinstance)
LEFT JOIN molinahealth_mdsdb.u_hr_case_final hr ON (SRC.sys_id=hr.sys_id AND SRC.sourceinstance=hr.sourceinstance)
LEFT JOIN molinahealth_mdsdb.u_hr_task_final ht ON (SRC.sys_id=ht.sys_id AND SRC.sourceinstance=ht.sourceinstance)
LEFT JOIN molinahealth_mdwdb.f_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN molinahealth_mdwdb.d_calendar_date LKP ON 
(date_format(convert_tz(COALESCE(inc.due_date,pr.due_date,pt.due_date,
cr.due_date,
-- ci.due_date,
ct.due_date,rq.due_date,hr.due_date,ht.due_date),'GMT','America/Los_Angeles'),'%Y%m%d')=LKP.row_id AND LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN COALESCE(inc.due_date,pr.due_date,pt.due_date,cr.due_date,ct.due_date,rq.due_date,
hr.due_date,ht.due_date) IS NULL THEN 0 ELSE -1 END)<>TRGT.due_on_key
 */




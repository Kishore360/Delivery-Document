SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_c.state_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM nbcu_mdsdb.task_final SRC 
left join nbcu_mdsdb.sc_request_final sc on sc.sys_id=SRC.sys_id and sc.sourceinstance=SRC.sourceinstance 
left join nbcu_mdsdb.incident_final inc on inc.sys_id=SRC.sys_id and inc.sourceinstance=SRC.sourceinstance 
left join nbcu_mdsdb.problem_final pr on pr.sys_id=SRC.sys_id and pr.sourceinstance=SRC.sourceinstance 
left join nbcu_mdsdb.problem_task_final prt on prt.sys_id=SRC.sys_id and prt.sourceinstance=SRC.sourceinstance 
left join nbcu_mdsdb.sc_req_item_final sri on sri.sys_id=SRC.sys_id and sri.sourceinstance=SRC.sourceinstance 
left join nbcu_mdsdb.sc_task_final sct on sct.sys_id=SRC.sys_id and sct.sourceinstance=SRC.sourceinstance 
left join nbcu_mdsdb.change_request_final cr on cr.sys_id=SRC.sys_id and cr.sourceinstance=SRC.sourceinstance 
left join nbcu_mdsdb.rm_defect_final rm_d on rm_d.sys_id=SRC.sys_id and rm_d.sourceinstance=SRC.sourceinstance 
left join nbcu_mdsdb.rm_enhancement_final rm_e on rm_e.sys_id=SRC.sys_id and rm_e.sourceinstance=SRC.sourceinstance 
left join nbcu_mdsdb.change_task_final ct on ct.sys_id=SRC.sys_id and ct.sourceinstance=SRC.sourceinstance
LEFT JOIN nbcu_mdwdb.f_task_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN nbcu_mdwdb.d_lov LKP ON 
(
CASE 
WHEN SRC.sys_class_name ='incident' THEN COALESCE( CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
WHEN SRC.sys_class_name ='problem' THEN COALESCE( CONCAT('STATE','~','PROBLEM','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
WHEN SRC.sys_class_name ='problem_task' THEN COALESCE( CONCAT('STATE','~','PROBLEM_TASK','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
WHEN SRC.sys_class_name ='sc_req_item' THEN COALESCE( CONCAT('STATE','~','SC_REQ_ITEM','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
WHEN SRC.sys_class_name ='sc_task' THEN COALESCE( CONCAT('STATE','~','SC_TASK','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
WHEN SRC.sys_class_name ='sc_request' THEN COALESCE( CONCAT('REQUEST_STATE','~','SC_REQUEST','~','~','~',UPPER(sc.request_state)),'UNSPECIFIED')
WHEN SRC.sys_class_name ='change_request' THEN COALESCE( CONCAT('STATE','~','CHANGE_REQUEST','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
WHEN SRC.sys_class_name ='change_task' THEN COALESCE( CONCAT('STATE','~','CHANGE_TASK','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
WHEN SRC.sys_class_name ='rm_enhancement' THEN COALESCE( CONCAT('STATE','~','RM_ENHANCEMENT','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
WHEN SRC.sys_class_name ='rm_defect' THEN COALESCE( CONCAT('STATE','~','RM_DEFECT','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
END =LKP.row_id and SRC.sourceinstance=LKP.source_id
)
WHERE COALESCE(LKP.row_key,
CASE WHEN SRC.state IS NULL THEN 0 ELSE -1 END)<> TRGT.state_src_key
)temp;


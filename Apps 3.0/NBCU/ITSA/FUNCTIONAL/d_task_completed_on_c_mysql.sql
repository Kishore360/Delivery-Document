 
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from  nbcu_mdwdb.d_task a 
    join nbcu_mdsdb.task_final i on a.row_id=i.sys_id and a.source_id=i.sourceinstance
    left join nbcu_mdsdb.sc_request_final sc on sc.sys_id=i.sys_id and sc.sourceinstance=i.sourceinstance
                left join nbcu_mdsdb.incident_final inc on inc.sys_id=i.sys_id and inc.sourceinstance=i.sourceinstance
                left join nbcu_mdsdb.problem_final pr on pr.sys_id=i.sys_id and pr.sourceinstance=i.sourceinstance
                left join nbcu_mdsdb.problem_task_final prt on prt.sys_id=i.sys_id and prt.sourceinstance=i.sourceinstance
                left join nbcu_mdsdb.sc_req_item_final sri on sri.sys_id=i.sys_id and sri.sourceinstance=i.sourceinstance
                left join nbcu_mdsdb.sc_task_final sct on sct.sys_id=i.sys_id and sct.sourceinstance=i.sourceinstance
                left join nbcu_mdsdb.change_request_final cr on cr.sys_id=i.sys_id and cr.sourceinstance=i.sourceinstance
                where  a.completed_on_c<>CASE
                                WHEN i.sys_class_name ='INCIDENT' THEN  CONVERT_TZ(coalesce(inc.resolved_at,inc.closed_at),'GMT','America/New_York')
                                WHEN i.sys_class_name ='PROBLEM' THEN CONVERT_TZ (pr.u_validated_at,'GMT','America/New_York')
                                WHEN i.sys_class_name ='PROBLEM_TASK' THEN CONVERT_TZ (prt.closed_at,'GMT','America/New_York')
                                WHEN i.sys_class_name ='SC_REQ_ITEM' THEN CONVERT_TZ(sri.u_fulfilled_at,'GMT','America/New_York')
                                WHEN i.sys_class_name ='SC_TASK' THEN CONVERT_TZ (sct.closed_at,'GMT','America/New_York')
                                WHEN i.sys_class_name ='SC_REQUEST' THEN CONVERT_TZ (sri.u_fulfilled_at,'GMT','America/New_York')
                                WHEN i.sys_class_name ='CHANGE_REQUEST' THEN CONVERT_TZ (cr.closed_at,'GMT','America/New_York')
                                WHEN i.sys_class_name ='CHANGE_TASK' THEN CONVERT_TZ (i.closed_at,'GMT','America/New_York')
                                WHEN i.sys_class_name ='RM_ENHANCEMENT' THEN CONVERT_TZ (sri.closed_at,'GMT','America/New_York')
                                WHEN i.sys_class_name ='RM_DEFECT' THEN CONVERT_TZ (sri.closed_at,'GMT','America/New_York')
        END)
		
		
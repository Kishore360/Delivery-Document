 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from 
(select TRGT.state_src_key ,CASE 
WHEN i.sys_class_name ='sc_request' then sc.request_state 
else i.state end as STATE_SRC_CODE ,
CASE 
WHEN i.sys_class_name ='INCIDENT' THEN COALESCE( CONCAT('STATE','','INCIDENT','','','',UPPER(inc.state)),'UNSPECIFIED')
WHEN i.sys_class_name ='PROBLEM' THEN COALESCE( CONCAT('STATE','','PROBLEM','','','',UPPER(pr.state)),'UNSPECIFIED')
WHEN i.sys_class_name ='SC_REQ_ITEM' THEN COALESCE( CONCAT('STATE','','SC_REQ_ITEM','','','',UPPER(sri.state)),'UNSPECIFIED')
WHEN i.sys_class_name ='SC_TASK' THEN COALESCE( CONCAT('STATE','','SC_TASK','','','',UPPER(sct.state)),'UNSPECIFIED')
WHEN i.sys_class_name ='SC_REQUEST' THEN COALESCE( CONCAT('REQUEST_STATE','','SC_REQUEST','','','',UPPER(sc.request_state)),'UNSPECIFIED')
WHEN i.sys_class_name ='CHANGE_REQUEST' THEN COALESCE( CONCAT('STATE','','CHANGE_REQUEST','','','',UPPER(cr.state)),'UNSPECIFIED')
WHEN i.sys_class_name ='U_AD_HOC_REQUEST' THEN COALESCE( CONCAT('STATE','','ADHOC_REQ','','','',UPPER(i.state)),'UNSPECIFIED')
WHEN i.sys_class_name ='U_IT_TASK' THEN COALESCE( CONCAT('STATE','','TASK','','','',UPPER(i.state)),'UNSPECIFIED')
WHEN i.sys_class_name ='CHANGE_TASK' THEN COALESCE( CONCAT('STATE','','TASK','','','',UPPER(i.state)),'UNSPECIFIED')
WHEN i.sys_class_name ='PROBLEM_TASK' THEN COALESCE( CONCAT('STATE','','PROBLEM_TASK','','','',UPPER(i.state)),'UNSPECIFIED')
END
AS STATE_SRC_ID
	from rambus_mdsdb.task_final i 
	left join rambus_mdsdb.sc_request_final sc on sc.sys_id=i.sys_id and sc.sourceinstance=i.sourceinstance 
	left join rambus_mdsdb.incident_final inc on inc.sys_id=i.sys_id and inc.sourceinstance=i.sourceinstance 
	left join rambus_mdsdb.problem_final pr on pr.sys_id=i.sys_id and pr.sourceinstance=i.sourceinstance 
	left join rambus_mdsdb.problem_task_final prt on prt.sys_id=i.sys_id and prt.sourceinstance=i.sourceinstance 
	left join rambus_mdsdb.sc_req_item_final sri on sri.sys_id=i.sys_id and sri.sourceinstance=i.sourceinstance 
	left join rambus_mdsdb.sc_task_final sct on sct.sys_id=i.sys_id and sct.sourceinstance=i.sourceinstance 
	left join rambus_mdsdb.change_request_final cr on cr.sys_id=i.sys_id and cr.sourceinstance=i.sourceinstance
 join rambus_mdwdb.f_task_c TRGT ON (i.sys_id =TRGT.row_id  
 AND i.sourceinstance= TRGT.source_id)	)a
	left JOIN rambus_mdwdb.d_lov LKP 
 on a.STATE_SRC_ID=LKP.src_rowid
WHERE COALESCE(LKP.row_key)<>a.state_src_key)temp



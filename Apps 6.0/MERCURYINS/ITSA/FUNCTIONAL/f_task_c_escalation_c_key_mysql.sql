SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  mercuryins_mdsdb.task_final s
left  JOIN mercuryins_mdwdb.f_task_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  
join mercuryins_mdwdb.d_lov l
ON CASE 
		WHEN s.sys_class_name ='INCIDENT' THEN COALESCE( CONCAT('ESCALATION','~','INCIDENT','~','~','~',UPPER(s.escalation)),'UNSPECIFIED')
		WHEN s.sys_class_name ='u_asc_ticket' THEN COALESCE( CONCAT('ESCALATION','~','u_asc_ticket','~','~','~',UPPER(s.escalation)),'UNSPECIFIED')
		ELSE COALESCE( CONCAT('ESCALATION','~','TASK','~','~','~',UPPER(s.escalation)),'UNSPECIFIED')
		
	END= l.row_id
 
WHERE COALESCE(l.row_key,CASE WHEN s.escalation IS NULL THEN 0 else '-1' end)<>
 t.escalation_c_key
) temp


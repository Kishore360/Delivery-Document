SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  molinahealth_mdsdb.task_final s
left  JOIN molinahealth_mdwdb.f_task_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  
join molinahealth_mdwdb.d_lov l
ON CASE 
		WHEN s.sys_class_name ='SC_REQ_ITEM' THEN COALESCE( CONCAT('APPROVAL','~','SC_REQ_ITEM','~','~','~',UPPER(s.approval)),'UNSPECIFIED')
		WHEN s.sys_class_name ='SC_REQUEST' THEN COALESCE( CONCAT('APPROVAL','~','SC_REQUEST','~','~','~',UPPER(s.approval)),'UNSPECIFIED')
		WHEN s.sys_class_name ='CHANGE_REQUEST' THEN COALESCE( CONCAT('APPROVAL','~','CHANGE_REQUEST','~','~','~',UPPER(s.approval)),'UNSPECIFIED')
		ELSE COALESCE( CONCAT('APPROVAL','~','TASK','~','~','~',UPPER(s.approval)),'UNSPECIFIED')
	END= l.row_id
 
WHERE COALESCE(l.row_key,CASE WHEN s.approval IS NULL THEN 0 else '-1' end)<>
 t.approval_state_src_key
) temp


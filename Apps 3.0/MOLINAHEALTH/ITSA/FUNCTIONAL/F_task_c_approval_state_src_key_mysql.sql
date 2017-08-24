SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  molinahealth_mdsdb.task_final s
left  JOIN molinahealth_mdwdb.f_task_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  
join molinahealth_mdwdb.d_lov l
ON  COALESCE( CONCAT('APPROVAL','~','TASK','~','~','~',UPPER(s.approval)),'UNSPECIFIED')= l.row_id
AND t.pivot_date between l.effective_from and l.effective_to 
WHERE COALESCE(l.row_key,CASE WHEN s.approval IS NULL THEN 0 else '-1' end)<>
 t.approval_state_src_key
) temp


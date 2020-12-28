SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  mercury_mdsdb.change_request_final s
left  JOIN mercury_mdwdb.f_change_request t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  and s.cdctype<>'D'
join mercury_mdwdb.d_lov l
ON COALESCE( CONCAT('APPROVAL','~','CHANGE_REQUEST','~',UPPER(s.approval)),'UNSPECIFIED')= l.row_id
 
WHERE COALESCE(l.row_key,CASE WHEN s.approval IS NULL THEN 0 else '-1' end)<>
 t.approval_state_src_key
) temp


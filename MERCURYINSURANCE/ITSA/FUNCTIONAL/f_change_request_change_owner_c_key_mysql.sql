SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from mercuryinsurance_mdsdb.change_request_final s
left  JOIN mercuryinsurance_mdwdb.f_change_request t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
left join mercuryinsurance_mdwdb.d_internal_contact l
on coalesce(concat('INTERNAL_CONTACT~',s.u_change_owner),'UNSPECIFIED')=l.row_id
and  s.sourceinstance=l.source_id
WHERE COALESCE(l.row_key,CASE WHEN s.u_change_owner IS NULL THEN 0 else -1 end)<> (t.change_owner_c_key))temp;
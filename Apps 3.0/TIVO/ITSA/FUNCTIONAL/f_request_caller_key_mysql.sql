
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.u_tech_ops_request_final s
left join tivo_mdwdb.f_request t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN tivo_mdwdb.d_internal_contact l 
 ON ( concat('INTERNAL_CONTACT~',u_caller)= l.row_id 
AND s.sourceinstance= l.source_id )
 WHERE COALESCE(l.row_key,CASE WHEN s.u_caller IS NULL THEN 0 else '-1' end)<> COALESCE(t.caller_key,'')
) temp


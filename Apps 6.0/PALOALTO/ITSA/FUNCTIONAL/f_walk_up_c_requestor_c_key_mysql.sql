 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan6_mdsdb.u_walk_up_final s
left join pan6_mdwdb.f_walk_up_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join pan6_mdwdb.d_internal_contact lkp
on lkp.row_id =coalesce(CONCAT('INTERNAL_CONTACT~',s.u_requestor),'UNSPECIFIED')
AND lkp.source_id=s.sourceinstance
WHERE coalesce(lkp.row_key,case when s.u_requestor is null then 0 else -1 end) <> t.requestor_c_key
) temp



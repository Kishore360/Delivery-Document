SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from cardinalhealth_mdsdb.rm_defect_final s
left join cardinalhealth_mdwdb.f_defect_rm_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join cardinalhealth_mdwdb.d_internal_contact lkp
on lkp.row_id = CONCAT('INTERNAL_CONTACT~',s.u_requestor)
AND lkp.source_id=s.sourceinstance
WHERE lkp.row_key <> t.requestor_c_key) temp
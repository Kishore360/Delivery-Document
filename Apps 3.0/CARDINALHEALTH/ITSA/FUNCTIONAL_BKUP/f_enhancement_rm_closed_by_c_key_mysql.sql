 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'MDS TO MDW DATA VALIDATION FAILED'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt
from cardinalhealth_mdsdb.rm_enhancement_final s
left join cardinalhealth_mdwdb.f_enhancement_rm t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join cardinalhealth_mdwdb.d_internal_contact lkp
on lkp.row_id =concat('INTERNAL_CONTACT~',s.closed_by)
AND lkp.source_id=s.sourceinstance
WHERE COALESCE(lkp.row_key,CASE WHEN s.closed_by IS NULL THEN 0 else -1 end) <> t.closed_by_c_key) temp
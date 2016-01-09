SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.hr_case_final s
left  JOIN asu_mdwdb.f_hr_case_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
left join asu_mdwdb.d_internal_organization l
ON ( COALESCE(CONCAT('GROUP','~',s.assignment_group),0)= l.row_id
 and s.sourceinstance=l.source_id)
WHERE COALESCE(l.row_key,CASE WHEN s.assignment_group IS NULL THEN 0 else '-1' end)<> COALESCE(t.assignment_group_key,'')
) temp
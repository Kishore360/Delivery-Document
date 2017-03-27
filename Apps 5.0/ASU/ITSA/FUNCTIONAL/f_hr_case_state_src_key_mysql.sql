
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.hr_case_final s
left join asu_mdwdb.f_hr_case t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN asu_mdwdb.d_lov l 
 ON ( CONCAT('STATE~HR_CASE~~~',UPPER(s.state))= l.row_id )
WHERE l.row_key <> t.state_src_key
) temp





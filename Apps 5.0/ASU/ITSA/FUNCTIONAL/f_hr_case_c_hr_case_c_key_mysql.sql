SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT count(1) as cnt
 FROM  asu_mdsdb.hr_case_final s
left join asu_mdwdb.d_hr_case d
on s.sys_id=d.row_id and s.sourceinstance=d.source_id
left join  asu_mdwdb.f_hr_case f 
on  s.sourceinstance=f.source_id and s.sys_id=f.row_id
WHERE d.row_key <> f.hr_case_key
) temp
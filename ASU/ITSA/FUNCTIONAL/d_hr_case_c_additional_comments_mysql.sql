SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.hr_case_final s
left  JOIN asu_mdwdb.d_hr_case_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
where s.comments <> t.additional_comments) b
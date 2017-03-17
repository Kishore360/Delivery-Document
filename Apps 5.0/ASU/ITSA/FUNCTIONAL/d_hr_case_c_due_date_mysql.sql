SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
FROM asu_mdsdb.hr_case_final s 
  join asu_mdwdb.d_hr_case_c t
ON (s.sys_id =t.row_id   AND s.sourceinstance= t.source_id  )
WHERE
s.due_date <> t.due_date
) b


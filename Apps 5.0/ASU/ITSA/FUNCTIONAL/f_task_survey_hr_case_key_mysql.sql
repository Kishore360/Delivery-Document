
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.task_final t 
JOIN asu_mdsdb.task_survey_final tsd ON tsd.task = t.sys_id
join asu_mdwdb.d_hr_case d on d.source_id = t.sourceinstance and
d.row_id=(CASE WHEN upper(t.sys_class_name) ='HR_CASE' THEN COALESCE(tsd.task,'UNSPECIFIED')
ELSE 'UNSPECIFIED'
END)
join asu_mdwdb.f_task_survey ts
ON ts.row_id=tsd.sys_id
AND ts.source_id=tsd.sourceinstance
where hr_case_key <>coalesce(d.row_key,case when tsd.task is null then 0 else -1 end)
)a; 
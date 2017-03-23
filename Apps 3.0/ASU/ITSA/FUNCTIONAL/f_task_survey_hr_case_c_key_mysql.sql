
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.task_final t 
left JOIN asu_mdsdb.task_survey_final tsd ON tsd.task = t.sys_id and upper(t.sys_class_name) ='HR_CASE'
left join asu_mdwdb.d_hr_case_c d on 
 d.row_id=COALESCE(tsd.task,'UNSPECIFIED') and tsd.sourceinstance=d.source_id
left join asu_mdwdb.f_task_survey ts
 ON ts.row_id=tsd.sys_id
AND ts.source_id=tsd.sourceinstance
where ts.hr_case_c_key=coalesce(d.row_key,case when tsd.task is null then 0 else -1 end)
					)a

					
					
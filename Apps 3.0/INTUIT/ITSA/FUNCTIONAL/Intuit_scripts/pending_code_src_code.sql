SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column pending_code_src_code'
           ELSE 'Data Matched for column pending_code_src_code'
       END AS Message
FROM
  (SELECT count(*) cnt from intuit_mdsdb.u_incident_task_final s
	inner join intuit_workdb.dwh_f_incident_task_c i on s.sys_id collate utf8_unicode_ci=i.row_id 
	where coalesce(s.u_pending_code collate utf8_unicode_ci,' ') <> coalesce(i.pending_code_src_code ,' ')) A;

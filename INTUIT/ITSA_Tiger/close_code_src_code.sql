SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column close_code_src_code'
           ELSE 'Data Matched for column close_code_src_code'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final s
   INNER JOIN intuit_workdb.dwh_f_incident_task_c i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   WHERE coalesce(s.u_close_code COLLATE utf8_unicode_ci,' ') <> coalesce(i.close_code_src_code,' ')) A;
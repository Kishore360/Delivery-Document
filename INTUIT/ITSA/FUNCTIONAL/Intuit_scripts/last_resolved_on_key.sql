SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column last_resolved_on_key'
           ELSE 'Data Matched for column last_resolved_on_key'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final s
   INNER JOIN intuit_workdb.dwh_f_incident_task_c i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE coalesce(DATE_FORMAT(CONVERT_TZ(s.u_actual_resolve_date,'GMT','America/New_York'),'%Y%m%d'),'0') <> coalesce(i.last_resolved_on_key,' ')) A;
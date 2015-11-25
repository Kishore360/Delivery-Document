SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_solution_timestamp.'
           ELSE 'Data Matched for column u_solution_timestamp'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   WHERE coalesce(s.u_solution_timestamp COLLATE utf8_unicode_ci,' ') <> coalesce(i.solution_duration_c,' '))A;
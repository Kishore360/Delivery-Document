SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_solution_timestamp'
           ELSE 'Data Matched for column u_solution_timestamp'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci = i.row_id
   WHERE CONVERT_TZ(coalesce(u_solution_timestamp,' '),'GMT','America/New_York') <> coalesce(i.Solution_on_c,' '))A;
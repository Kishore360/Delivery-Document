SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_start_date EST'
           ELSE 'Data Matched for column u_start_date EST'
       END AS Message
FROM
  (SELECT count(*) as cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE CONVERT_TZ(coalesce(u_start_date,' '),'GMT','America/New_York') <> coalesce(i.started_on_c,' ')) A;
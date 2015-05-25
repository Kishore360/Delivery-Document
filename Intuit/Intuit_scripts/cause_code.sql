SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column cause_code.'
           ELSE 'Data Matched for column cause_code'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   WHERE coalesce(s.u_symptom COLLATE utf8_unicode_ci,' ') <> coalesce(i.cause_code,' ')) A;
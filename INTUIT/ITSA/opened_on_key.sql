SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column opened_on_key'
           ELSE 'Data Matched for column opened_on_key'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final s
   INNER JOIN intuit_workdb.dwh_f_incident_task_c i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE coalesce(DATE_FORMAT(CONVERT_TZ(s.opened_at,'GMT','America/New_York'),'%Y%m%d'),'0') <> coalesce(i.opened_on_key,' '))A;
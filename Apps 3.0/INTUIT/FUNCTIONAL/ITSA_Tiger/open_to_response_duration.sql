SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column Open_to_response_duration'
           ELSE 'Data Matched for column Open_to_response_duration'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final s
   INNER JOIN intuit_workdb.dwh_f_incident_task_c i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE coalesce(timestampdiff(SECOND,'1970-01-01 00:00:00',s.u_response_duration),' ') <> coalesce(i.Open_to_response_duration,' '))A;
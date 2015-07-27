SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column engagement_duration_c.'
           ELSE 'Data Matched for column engagement_duration_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE timestampdiff(SECOND,'1970-01-01 00:00:00',coalesce(s.u_time_to_engage,'0')) <> i.engagement_duration_c) A;
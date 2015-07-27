SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column detect_on_key_c'
           ELSE 'Data Matched for column detect_on_key_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE DATE_FORMAT(CONVERT_TZ(coalesce(u_detect_date,'0'),'GMT','America/New_York'),'%Y%m%d') <> i.detect_on_key_c) A;
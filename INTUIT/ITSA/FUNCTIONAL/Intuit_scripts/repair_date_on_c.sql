SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column repair_date_on_c.'
           ELSE 'Data Matched for column repair_date_on_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   WHERE coalesce(s.u_repair_date,' ') <> coalesce(i.repair_date_on_c,' '))A;
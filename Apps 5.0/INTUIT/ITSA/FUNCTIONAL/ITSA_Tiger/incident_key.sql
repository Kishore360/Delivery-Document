SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column incident_key'
           ELSE 'Data Matched for column incident_key'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final a
   INNER JOIN intuit_workdb.dwh_f_incident_task_c b ON a.sys_id COLLATE utf8_unicode_ci = b.row_id
   AND a.sourceinstance=b.source_id 
   #and b.row_key < 5000
   LEFT OUTER JOIN intuit_workdb.dwh_d_incident c ON coalesce(a.u_ud_parent COLLATE utf8_unicode_ci,' ') = coalesce(c.row_id,' ')
   WHERE CASE WHEN a.u_ud_parent IS NULL THEN '0' ELSE CASE WHEN c.row_key IS NULL THEN '-1' ELSE c.row_key END END <> b.incident_key) A;
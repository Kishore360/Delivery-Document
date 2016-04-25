SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column opened_by_key.'
           ELSE 'Data Matched for column opened_by_key'
       END AS Message 
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final a
   INNER JOIN intuit_workdb.dwh_f_incident b ON a.sys_id COLLATE utf8_general_ci = b.row_id
   AND a.sourceinstance=b.source_id
   AND b.row_key < 1000
   LEFT OUTER JOIN intuit_workdb.dwh_d_internal_contact c ON coalesce(a.u_client COLLATE utf8_general_ci,' ') = coalesce(c.row_id,' ')
   WHERE CASE WHEN a.u_client IS NULL THEN '0' ELSE CASE WHEN c.row_key IS NULL THEN '-1' ELSE c.row_key END END <> b.opened_by_key)A;
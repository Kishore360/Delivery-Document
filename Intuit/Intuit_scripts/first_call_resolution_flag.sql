SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column first_call_resolution_flag'
           ELSE 'Data Matched for column first_call_resolution_flag'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM
     (SELECT i.first_call_resolution_flag,
             CASE WHEN s.u_fcr = '1' THEN 'Y' WHEN s.u_fcr ='0' THEN 'N' ELSE NULL END AS fcrflag
      FROM intuit_mdsdb.incident_final s
      INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
      AND s.sourceinstance = i.source_id)A
   WHERE coalesce(first_call_resolution_flag,' ') <> coalesce(fcrflag,' ')) A;
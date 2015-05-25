SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column major_incident_flag'
           ELSE 'Data Matched for column major_incident_flag'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM
     (SELECT i.major_incident_flag,
             CASE WHEN s.u_major_incident = '1' THEN 'Y' WHEN s.u_major_incident ='0' THEN 'N' ELSE NULL END AS majorincidentflag
      FROM intuit_mdsdb.incident_final s
      INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
      AND s.sourceinstance = i.source_id) A
   WHERE coalesce(major_incident_flag,' ') <> coalesce(majorincidentflag,' ')) A;
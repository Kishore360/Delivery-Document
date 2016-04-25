SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_business_service.'
           ELSE 'Data Matched for column u_business_service'
       END AS Message FROM
  (SELECT count(*) AS cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE coalesce(s.u_business_service COLLATE utf8_unicode_ci,' ') <> coalesce(i.business_service_code_c,' ')) A;
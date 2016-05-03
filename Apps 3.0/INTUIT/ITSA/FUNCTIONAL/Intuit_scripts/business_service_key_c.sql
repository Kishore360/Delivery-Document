SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column business_service_key_c.'
           ELSE 'Data Matched for column business_service_key_c'
       END AS Message FROM
  (SELECT count(*) AS cnt
   FROM intuit_mdsdb.incident_final a
   INNER JOIN intuit_workdb.dwh_f_incident b ON a.sys_id COLLATE utf8_unicode_ci = b.row_id
   AND a.sourceinstance=b.source_id -- and b.row_key < 500
   LEFT OUTER JOIN intuit_workdb.dwh_d_configuration_item c ON coalesce(a.u_business_service COLLATE utf8_unicode_ci) = c.row_id
   WHERE CASE WHEN a.u_business_service IS NULL THEN '0' ELSE CASE WHEN c.row_key IS NULL THEN '-1' ELSE c.row_key END END <> b.business_service_key_c) A;